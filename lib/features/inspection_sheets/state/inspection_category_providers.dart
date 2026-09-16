import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/repository/inspection_category_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_category_providers.g.dart';

final inspectionCategoryRepository = InspectionCategoryRepository();

@riverpod
Stream<List<InspectionCategory>> inspectionCategories(
  Ref ref,
  String sheetId, {
  bool archived = false,
}) {
  return inspectionCategoryRepository.getInspectionCategories(
    sheetId,
    archived: archived,
  );
}

@riverpod
Stream<InspectionCategory?> inspectionCategoryById(
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
Future<void> addInspectionCategory(Ref ref, InspectionCategory category) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.addInspectionCategory(
    category,
    currentUser,
  );
}

@riverpod
Future<void> updateInspectionCategory(Ref ref, InspectionCategory category) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.updateInspectionCategory(
    category,
    currentUser,
  );
}

@riverpod
Future<void> setInspectionCategoryArchived(
  Ref ref,
  InspectionCategory category, {
  required bool archived,
}) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.setInspectionCategoryArchived(
    category,
    currentUser,
    archived: archived,
  );
}

@riverpod
Future<void> reorderInspectionCategories(
  Ref ref,
  String sheetId,
  List<String> orderedCategoryIds,
) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionCategoryRepository.reorderInspectionCategories(
    sheetId,
    orderedCategoryIds,
    currentUser,
  );
}
