import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
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

  Future<void> recordDecision(
    String inspectionId,
    String scrutPointId,
    InspectionPointDecisionInput input,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    batch.set(_rawEventsRef(inspectionId, scrutPointId).doc(), {
      'inspectionId': inspectionId,
      'scrutPointId': scrutPointId,
      ...input.toFirestore(),
      'actorId': currentUser.id,
      'actorName': currentUser.fullName,
      'occurredAt': FieldValue.serverTimestamp(),
    });

    batch.update(_rawResultsRef(inspectionId).doc(scrutPointId), {
      'currentStatus': input.status.name,
      'latestJudgeId': currentUser.id,
      'latestJudgeName': currentUser.fullName,
      'latestDecisionAt': FieldValue.serverTimestamp(),
      ...AuditMetadata.updateFields(currentUser),
    });
    await batch.commit();
  }

  Future<void> setAddressed(
    String inspectionId,
    String scrutPointId,
    InspectionPointStatus currentStatus,
    InspectionPointAddressInput input,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    batch.set(_rawEventsRef(inspectionId, scrutPointId).doc(), {
      'inspectionId': inspectionId,
      'scrutPointId': scrutPointId,
      ...input.toFirestore(),
      'status': currentStatus.name,
      'actorId': currentUser.id,
      'actorName': currentUser.fullName,
      'occurredAt': FieldValue.serverTimestamp(),
    });

    batch.update(_rawResultsRef(inspectionId).doc(scrutPointId), {
      'isAddressed': input.addressed,
      'addressedNote': input.comment,
      ...AuditMetadata.updateFields(currentUser),
    });
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
