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
    return watchQuery(_ref(inspectionId), compare: _compareInspectionResults);
  }

  Stream<InspectionPointResult?> getInspectionPointResultByPointId(
    String inspectionId,
    String scrutPointId,
  ) {
    return watchDocument(_ref(inspectionId).doc(scrutPointId));
  }

  Stream<List<InspectionPointResult>> getResultsForScrutPoint(
    String sheetId,
    String categoryId,
    String subcategoryId,
    String pointId,
  ) {
    final pointRef = _firestore
        .collection('inspectionSheets')
        .doc(sheetId)
        .collection('categories')
        .doc(categoryId)
        .collection('subcategories')
        .doc(subcategoryId)
        .collection('points')
        .doc(pointId);

    final query = _firestore
        .collectionGroup('results')
        .where('pointRef', isEqualTo: pointRef)
        .withConverter(
          fromFirestore: InspectionPointResult.fromFirestore,
          toFirestore: (result, _) => result.toFirestore(),
        );
    return watchQuery(query, compare: _comparePointResults);
  }

  static int _compareInspectionResults(
    InspectionPointResult left,
    InspectionPointResult right,
  ) {
    final leftOrder = left.pointOrder;
    final rightOrder = right.pointOrder;
    if (leftOrder == null && rightOrder == null) {
      return left.scrutPointId.compareTo(right.scrutPointId);
    }
    if (leftOrder == null) return 1;
    if (rightOrder == null) return -1;

    final orderComparison = leftOrder.compareTo(rightOrder);
    if (orderComparison != 0) return orderComparison;

    return left.scrutPointId.compareTo(right.scrutPointId);
  }

  static int _comparePointResults(
    InspectionPointResult left,
    InspectionPointResult right,
  ) {
    final leftStartedAt = left.inspectionStartedAt;
    final rightStartedAt = right.inspectionStartedAt;
    if (leftStartedAt == null && rightStartedAt == null) {
      return right.inspectionId.compareTo(left.inspectionId);
    }
    if (leftStartedAt == null) return 1;
    if (rightStartedAt == null) return -1;
    return rightStartedAt.compareTo(leftStartedAt);
  }
}
