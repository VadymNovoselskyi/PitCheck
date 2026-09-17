import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionPointResultRepository {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<InspectionPointResult> _ref(String inspectionId) {
    return _firestore
        .collection('inspections')
        .doc(inspectionId)
        .collection('results')
        .withConverter(
          fromFirestore: InspectionPointResult.fromFirestore,
          toFirestore: (result, _) => result.toFirestore(),
        );
  }

  Stream<List<InspectionPointResult>> getInspectionPointResults(
    String inspectionId,
  ) {
    return watchQuery(_ref(inspectionId), compare: _compareResults);
  }

  Stream<InspectionPointResult?> getInspectionPointResultByPointId(
    String inspectionId,
    String scrutPointId,
  ) {
    return watchDocument(_ref(inspectionId).doc(scrutPointId));
  }

  Stream<List<InspectionPointResult>> getResultsForScrutPoint(
    String scrutPointId,
  ) {
    // Finds this point's results across every inspection (like inspections/inspection-a/results/point-1)
    final query = _firestore
        .collectionGroup('results')
        .where('scrutPointId', isEqualTo: scrutPointId)
        .withConverter(
          fromFirestore: InspectionPointResult.fromFirestore,
          toFirestore: (result, _) => result.toFirestore(),
        );
    return watchQuery(query, compare: _compareResults);
  }

  static int _compareResults(
    InspectionPointResult left,
    InspectionPointResult right,
  ) {
    final leftDecisionAt = left.latestDecisionAt;
    final rightDecisionAt = right.latestDecisionAt;
    if (leftDecisionAt == null && rightDecisionAt == null) {
      return right.id.compareTo(left.id);
    }
    if (leftDecisionAt == null) return 1;
    if (rightDecisionAt == null) return -1;
    return rightDecisionAt.compareTo(leftDecisionAt);
  }
}
