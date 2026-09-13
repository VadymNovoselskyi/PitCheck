import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/repository/inspection_category_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_category_providers.g.dart';

final inspectionCategoryRepository = InspectionCategoryRepository();

@riverpod
Stream<List<InspectionCategory>> inspectionCategories(Ref ref, String sheetId) {
  return inspectionCategoryRepository.getInspectionCategories(sheetId);
}

@riverpod
Stream<InspectionCategory> inspectionCategoryById(
  Ref ref,
  String sheetId,
  String categoryId,
) {
  return inspectionCategoryRepository.getInspectionCategoryById(
    sheetId,
    categoryId,
  );
}

@riverpod
Future<void> addInspectionCategory(
  Ref ref,
  String sheetId,
  InspectionCategory category,
) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.addInspectionCategory(
    sheetId,
    category,
    currentUser,
  );
}

@riverpod
Future<void> updateInspectionCategory(
  Ref ref,
  String sheetId,
  InspectionCategory category,
) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.updateInspectionCategory(
    sheetId,
    category,
    currentUser,
  );
}

@riverpod
Future<void> deleteInspectionCategory(
  Ref ref,
  String sheetId,
  String categoryId,
) {
  return inspectionCategoryRepository.deleteInspectionCategory(
    sheetId,
    categoryId,
  );
}
