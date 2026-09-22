import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionCategoryRepository {
  final _firestore = FirebaseFirestore.instance;

  // Raw maps are needed when audit writes include FieldValue.serverTimestamp().
  CollectionReference<Map<String, dynamic>> _rawRef(String sheetId) {
    return _firestore
        .collection('inspectionSheets')
        .doc(sheetId)
        .collection('categories');
  }

  // Reads use converted documents so callers receive InspectionCategory models.
  CollectionReference<InspectionCategory> _ref(String sheetId) {
    return _rawRef(sheetId).withConverter(
      fromFirestore: InspectionCategory.fromFirestore,
      toFirestore: (InspectionCategory category, _) => category.toFirestore(),
    );
  }

  Stream<List<InspectionCategory>> getInspectionCategories(
    String sheetId, {
    bool archived = false,
  }) {
    return watchQuery(
      _ref(sheetId),
      where: (category) => category.isArchived == archived,
      compare: _compareCategories,
    );
  }

  Stream<InspectionCategory?> getInspectionCategoryById(
    String sheetId,
    String categoryId,
  ) {
    return watchDocument(_ref(sheetId).doc(categoryId));
  }

  Future<void> addInspectionCategory(
    String sheetId,
    InspectionCategoryInput input,
    User currentUser,
  ) {
    return _rawRef(sheetId).doc().set({
      ...input.toFirestore(),
      'inspectionSheetId': sheetId,
      'order': null,
      'archivedAt': null,
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionCategory(
    String sheetId,
    String categoryId,
    InspectionCategoryInput input,
    User currentUser,
  ) {
    return _rawRef(sheetId).doc(categoryId).update({
      ...input.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> setInspectionCategoryArchived(
    InspectionCategory category,
    User currentUser, {
    required bool archived,
  }) {
    return _rawRef(category.inspectionSheetId).doc(category.id).update({
      'archivedAt': archived ? FieldValue.serverTimestamp() : null,
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> reorderInspectionCategories(
    String sheetId,
    List<String> orderedCategoryIds,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    final auditFields = AuditMetadata.updateFields(currentUser);

    for (var order = 0; order < orderedCategoryIds.length; order++) {
      final categoryId = orderedCategoryIds[order];

      batch.update(_rawRef(sheetId).doc(categoryId), {
        'order': order,
        ...auditFields,
      });
    }

    await batch.commit();
  }

  static int _compareCategories(
    InspectionCategory left,
    InspectionCategory right,
  ) {
    final leftOrder = left.order;
    final rightOrder = right.order;
    if (leftOrder == null && rightOrder == null) {
      return left.type.label.compareTo(right.type.label);
    }
    if (leftOrder == null) return 1;
    if (rightOrder == null) return -1;
    return leftOrder.compareTo(rightOrder);
  }
}
