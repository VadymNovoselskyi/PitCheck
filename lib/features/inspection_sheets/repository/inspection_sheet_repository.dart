import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class InspectionSheetRepository {
  // Raw documents are used for writes that include Firestore server timestamps.
  static final _rawRef = FirebaseFirestore.instance.collection(
    'inspectionSheets',
  );

  static final ref = _rawRef.withConverter(
    fromFirestore: InspectionSheet.fromFirestore,
    toFirestore: (InspectionSheet sheet, _) => sheet.toFirestore(),
  );

  Stream<List<InspectionSheet>> getInspectionSheets() {
    return ref.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Stream<InspectionSheet> getInspectionSheetById(String id) {
    return ref.doc(id).snapshots().map((snapshot) => snapshot.data()!);
  }

  Future<void> addInspectionSheet(InspectionSheet sheet, User currentUser) {
    return _rawRef.doc(sheet.id).set({
      ...sheet.toFirestore(),
      // Adds creator data and server timestamps under the nested audit field.
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionSheet(InspectionSheet sheet, User currentUser) {
    return _rawRef.doc(sheet.id).update({
      ...sheet.toFirestore(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> deleteInspectionSheet(String id) {
    return ref.doc(id).delete();
  }
}
