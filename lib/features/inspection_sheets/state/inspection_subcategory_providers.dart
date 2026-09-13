import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/inspection_sheets/repository/inspection_subcategory_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_subcategory_providers.g.dart';

final inspectionSubcategoryRepository = InspectionSubcategoryRepository();

@riverpod
Stream<List<InspectionSubcategory>> inspectionSubcategories(
  Ref ref,
  String sheetId,
  String categoryId,
) {
  return inspectionSubcategoryRepository.getInspectionSubcategories(
    sheetId,
    categoryId,
  );
}

@riverpod
Stream<InspectionSubcategory> inspectionSubcategoryById(
  Ref ref,
  String sheetId,
  String categoryId,
  String subcategoryId,
) {
  return inspectionSubcategoryRepository.getInspectionSubcategoryById(
    sheetId,
    categoryId,
    subcategoryId,
  );
}

@riverpod
Future<void> addInspectionSubcategory(
  Ref ref,
  String sheetId,
  String categoryId,
  InspectionSubcategory subcategory,
) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionSubcategoryRepository.addInspectionSubcategory(
    sheetId,
    categoryId,
    subcategory,
    currentUser,
  );
}

@riverpod
Future<void> updateInspectionSubcategory(
  Ref ref,
  String sheetId,
  String categoryId,
  InspectionSubcategory subcategory,
) {
  final currentUser = ref.read(currentUserProvider);
  return inspectionSubcategoryRepository.updateInspectionSubcategory(
    sheetId,
    categoryId,
    subcategory,
    currentUser,
  );
}

@riverpod
Future<void> deleteInspectionSubcategory(
  Ref ref,
  String sheetId,
  String categoryId,
  String subcategoryId,
) {
  return inspectionSubcategoryRepository.deleteInspectionSubcategory(
    sheetId,
    categoryId,
    subcategoryId,
  );
}
