import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

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

  Stream<List<InspectionCategory>> getInspectionCategories(String sheetId) {
    return _ref(sheetId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Stream<InspectionCategory> getInspectionCategoryById(
    String sheetId,
    String categoryId,
  ) {
    return _ref(sheetId)
        .doc(categoryId)
        .snapshots()
        .map((snapshot) => snapshot.data()!);
  }

  Future<void> addInspectionCategory(
    String sheetId,
    InspectionCategory category,
    User currentUser,
  ) {
    return _rawRef(sheetId).doc(category.id).set({
      ...category.toFirestore(),
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionCategory(
    String sheetId,
    InspectionCategory category,
    User currentUser,
  ) {
    return _rawRef(sheetId).doc(category.id).update({
      ...category.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> deleteInspectionCategory(String sheetId, String categoryId) {
    return _ref(sheetId).doc(categoryId).delete();
  }
}
