import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionSheetRepository {
  // Raw documents are used for writes that include Firestore server timestamps.
  static final _rawRef = FirebaseFirestore.instance.collection(
    'inspectionSheets',
  );

  static final ref = _rawRef.withConverter(
    fromFirestore: InspectionSheet.fromFirestore,
    toFirestore: (InspectionSheet sheet, _) => sheet.toFirestore(),
  );

  Stream<List<InspectionSheet>> getInspectionSheets({bool archived = false}) {
    return watchQuery(
      ref,
      where: (sheet) => sheet.isArchived == archived,
      compare: _compareSheets,
    );
  }

  Stream<InspectionSheet?> getInspectionSheetById(String id) {
    return watchDocument(ref.doc(id));
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

  Future<void> setInspectionSheetArchived(
    InspectionSheet sheet,
    User currentUser, {
    required bool archived,
  }) {
    return _rawRef.doc(sheet.id).update({
      'archivedAt': archived ? FieldValue.serverTimestamp() : null,
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  static int _compareSheets(InspectionSheet left, InspectionSheet right) {
    final yearComparison = right.year.compareTo(left.year);
    if (yearComparison != 0) {
      return yearComparison;
    }
    return left.competitionName.toLowerCase().compareTo(
      right.competitionName.toLowerCase(),
    );
  }
}
