import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionPointEventRepository {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _rawResultsRef(
    String inspectionId,
  ) {
    return _firestore
        .collection('inspections')
        .doc(inspectionId)
        .collection('results');
  }

  CollectionReference<Map<String, dynamic>> _rawEventsRef(
    String inspectionId,
    String scrutPointId,
  ) {
    return _rawResultsRef(inspectionId).doc(scrutPointId).collection('events');
  }

  Stream<List<InspectionPointEvent>> getInspectionPointEvents(
    String inspectionId,
    String scrutPointId,
  ) {
    return watchQuery(
      _rawEventsRef(inspectionId, scrutPointId).withConverter(
        fromFirestore: InspectionPointEvent.fromFirestore,
        toFirestore: (event, _) => event.toFirestore(),
      ),
      compare: _compareEvents,
    );
  }

  Future<void> addInspectionPointEvent(
    InspectionPointEvent event,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    batch.set(
      _rawEventsRef(event.inspectionId, event.scrutPointId).doc(event.id),
      {...event.toFirestore(), 'occurredAt': FieldValue.serverTimestamp()},
    );

    final resultFields = <String, dynamic>{
      ...AuditMetadata.updateFields(currentUser),
    };
    switch (event.type) {
      case InspectionPointEventType.decision:
        resultFields.addAll({
          'currentStatus': event.status.name,
          'latestJudgeId': event.actorId,
          'latestJudgeName': event.actorName,
          'latestDecisionAt': FieldValue.serverTimestamp(),
        });
      case InspectionPointEventType.markedAddressed:
        resultFields.addAll({
          'isAddressed': true,
          'addressedNote': event.comment,
        });
      case InspectionPointEventType.markedUnaddressed:
        resultFields.addAll({
          'isAddressed': false,
          'addressedNote': event.comment,
        });
    }
    batch.update(
      _rawResultsRef(event.inspectionId).doc(event.scrutPointId),
      resultFields,
    );
    await batch.commit();
  }

  static int _compareEvents(
    InspectionPointEvent left,
    InspectionPointEvent right,
  ) {
    final leftOccurredAt = left.occurredAt;
    final rightOccurredAt = right.occurredAt;
    if (leftOccurredAt == null && rightOccurredAt == null) {
      return left.id.compareTo(right.id);
    }
    if (leftOccurredAt == null) return 1;
    if (rightOccurredAt == null) return -1;
    return leftOccurredAt.compareTo(rightOccurredAt);
  }
}
