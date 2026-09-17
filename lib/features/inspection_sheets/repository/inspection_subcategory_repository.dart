import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionSubcategoryRepository {
  final _firestore = FirebaseFirestore.instance;

  // Raw maps are needed when audit writes include FieldValue.serverTimestamp().
  CollectionReference<Map<String, dynamic>> _rawRef(
    String sheetId,
    String categoryId,
  ) {
    return _firestore
        .collection('inspectionSheets')
        .doc(sheetId)
        .collection('categories')
        .doc(categoryId)
        .collection('subcategories');
  }

  // Reads use converted documents so callers receive InspectionCategory models.
  CollectionReference<InspectionSubcategory> _ref(
    String sheetId,
    String categoryId,
  ) {
    return _rawRef(sheetId, categoryId).withConverter(
      fromFirestore: InspectionSubcategory.fromFirestore,
      toFirestore: (InspectionSubcategory subcategory, _) =>
          subcategory.toFirestore(),
    );
  }

  Stream<List<InspectionSubcategory>> getInspectionSubcategories(
    String sheetId,
    String categoryId, {
    bool archived = false,
  }) {
    return watchQuery(
      _ref(sheetId, categoryId),
      where: (subcategory) => subcategory.isArchived == archived,
      compare: _compareSubcategories,
    );
  }

  Stream<InspectionSubcategory?> getInspectionSubcategoryById(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) {
    return watchDocument(_ref(sheetId, categoryId).doc(subcategoryId));
  }

  Future<void> addInspectionSubcategory(
    String sheetId,
    InspectionSubcategory subcategory,
    User currentUser,
  ) {
    return _rawRef(sheetId, subcategory.inspectionCategoryId).doc().set({
      ...subcategory.toFirestore(),
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionSubcategory(
    String sheetId,
    InspectionSubcategory subcategory,
    User currentUser,
  ) {
    return _rawRef(
      sheetId,
      subcategory.inspectionCategoryId,
    ).doc(subcategory.id).update({
      ...subcategory.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> setInspectionSubcategoryArchived(
    String sheetId,
    InspectionSubcategory subcategory,
    User currentUser, {
    required bool archived,
  }) {
    return _rawRef(
      sheetId,
      subcategory.inspectionCategoryId,
    ).doc(subcategory.id).update({
      'archivedAt': archived ? FieldValue.serverTimestamp() : null,
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> reorderInspectionSubcategories(
    String sheetId,
    String categoryId,
    List<String> orderedSubcategoryIds,
    User currentUser,
  ) async {
    final batch = _firestore.batch();
    final auditFields = AuditMetadata.updateFields(currentUser);

    for (var order = 0; order < orderedSubcategoryIds.length; order++) {
      final categoryId = orderedSubcategoryIds[order];

      batch.update(_rawRef(sheetId, categoryId).doc(categoryId), {
        'order': order,
        ...auditFields,
      });
    }

    await batch.commit();
  }

  static int _compareSubcategories(
    InspectionSubcategory left,
    InspectionSubcategory right,
  ) {
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
