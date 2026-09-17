import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class ScrutPointRepository {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _rawRef(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) {
    return _firestore
        .collection('inspectionSheets')
        .doc(sheetId)
        .collection('categories')
        .doc(categoryId)
        .collection('subcategories')
        .doc(subcategoryId)
        .collection('points');
  }

  CollectionReference<ScrutPoint> _ref(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) {
    return _rawRef(sheetId, categoryId, subcategoryId).withConverter(
      fromFirestore: ScrutPoint.fromFirestore,
      toFirestore: (point, _) => point.toFirestore(),
    );
  }

  Stream<List<ScrutPoint>> getScrutPoints(
    String sheetId,
    String categoryId,
    String subcategoryId, {
    bool archived = false,
  }) {
    return watchQuery(
      _ref(sheetId, categoryId, subcategoryId),
      where: (point) => point.isArchived == archived,
      compare: _comparePoints,
    );
  }

  Stream<ScrutPoint?> getScrutPointById(
    String sheetId,
    String categoryId,
    String subcategoryId,
    String pointId,
  ) {
    return watchDocument(_ref(sheetId, categoryId, subcategoryId).doc(pointId));
  }

  Future<void> addScrutPoint(
    String sheetId,
    String categoryId,
    ScrutPoint point,
    User currentUser,
  ) {
    return _rawRef(sheetId, categoryId, point.subcategoryId).doc().set({
      ...point.toFirestore(),
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateScrutPoint(
    String sheetId,
    String categoryId,
    ScrutPoint point,
    User currentUser,
  ) {
    return _rawRef(
      sheetId,
      categoryId,
      point.subcategoryId,
    ).doc(point.id).update({
      ...point.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> setScrutPointArchived(
    String sheetId,
    String categoryId,
    ScrutPoint point,
    User currentUser, {
    required bool archived,
  }) {
    return _rawRef(
      sheetId,
      categoryId,
      point.subcategoryId,
    ).doc(point.id).update({
      'archivedAt': archived ? FieldValue.serverTimestamp() : null,
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> reorderScrutPoints(
    String sheetId,
    String categoryId,
    String subcategoryId,
    List<String> orderedPointIds,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    final auditFields = AuditMetadata.updateFields(currentUser);

    for (var order = 0; order < orderedPointIds.length; order++) {
      final pointId = orderedPointIds[order];
      batch.update(_rawRef(sheetId, categoryId, subcategoryId).doc(pointId), {
        'order': order,
        ...auditFields,
      });
    }

    await batch.commit();
  }

  static int _comparePoints(ScrutPoint left, ScrutPoint right) {
    final leftOrder = left.order;
    final rightOrder = right.order;
    if (leftOrder == null && rightOrder == null) {
      return left.name.toLowerCase().compareTo(right.name.toLowerCase());
    }
    if (leftOrder == null) return 1;
    if (rightOrder == null) return -1;
    return leftOrder.compareTo(rightOrder);
  }
}
