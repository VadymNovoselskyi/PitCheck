import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

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
    String categoryId,
  ) {
    return _ref(sheetId, categoryId).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Stream<InspectionSubcategory> getInspectionSubcategoryById(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) {
    return _ref(
      sheetId,
      categoryId,
    ).doc(subcategoryId).snapshots().map((snapshot) => snapshot.data()!);
  }

  Future<void> addInspectionSubcategory(
    String sheetId,
    String categoryId,
    InspectionSubcategory subcategory,
    User currentUser,
  ) {
    return _rawRef(sheetId, categoryId).doc(subcategory.id).set({
      ...subcategory.toFirestore(),
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionSubcategory(
    String sheetId,
    String categoryId,
    InspectionSubcategory subcategory,
    User currentUser,
  ) {
    return _rawRef(sheetId, categoryId).doc(subcategory.id).update({
      ...subcategory.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> deleteInspectionSubcategory(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) {
    return _ref(sheetId, categoryId).doc(subcategoryId).delete();
  }
}
