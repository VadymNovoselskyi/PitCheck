import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/archive_filter.dart';
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

  Stream<List<InspectionSheet>> getInspectionSheets({
    ArchiveFilter filter = ArchiveFilter.active,
  }) {
    return watchQuery(
      ref,
      where: (sheet) => filter.includes(sheet.isArchived),
      compare: _compareSheets,
    );
  }

  Stream<InspectionSheet?> getInspectionSheetById(String id) {
    return watchDocument(ref.doc(id));
  }

  Future<void> addInspectionSheet(
    InspectionSheetInput input,
    User currentUser,
  ) {
    return _rawRef.doc().set({
      ...input.toFirestore(),
      'archivedAt': null,
      // Adds creator data and server timestamps under the nested audit field.
      ...AuditMetadata.createFields(currentUser),
    });
  }

  Future<void> updateInspectionSheet(
    String sheetId,
    InspectionSheetInput input,
    User currentUser,
  ) {
    return _rawRef.doc(sheetId).update({
      ...input.toFirestore(),
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
