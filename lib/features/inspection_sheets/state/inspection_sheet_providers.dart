import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/repository/inspection_sheet_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_sheet_providers.g.dart';

final inspectionSheetRepository = InspectionSheetRepository();

@riverpod
Stream<List<InspectionSheet>> inspectionSheets(
  Ref ref, {
  bool archived = false,
}) {
  return inspectionSheetRepository.getInspectionSheets(archived: archived);
}

@riverpod
Stream<InspectionSheet?> inspectionSheetById(Ref ref, String id) {
  return inspectionSheetRepository.getInspectionSheetById(id);
}

@riverpod
Future<void> addInspectionSheet(Ref ref, InspectionSheet sheet) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionSheetRepository.addInspectionSheet(sheet, currentUser);
}

@riverpod
Future<void> updateInspectionSheet(Ref ref, InspectionSheet sheet) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionSheetRepository.updateInspectionSheet(sheet, currentUser);
}

@riverpod
Future<void> setInspectionSheetArchived(
  Ref ref,
  InspectionSheet sheet, {
  required bool archived,
}) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionSheetRepository.setInspectionSheetArchived(
    sheet,
    currentUser,
    archived: archived,
  );
}
