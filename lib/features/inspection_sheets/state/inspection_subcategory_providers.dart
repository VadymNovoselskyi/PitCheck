import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/inspection_sheets/repository/inspection_subcategory_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/archive_filter.dart';

part 'inspection_subcategory_providers.g.dart';

final inspectionSubcategoryRepository = InspectionSubcategoryRepository();

@riverpod
Stream<List<InspectionSubcategory>> inspectionSubcategories(
  Ref ref,
  String sheetId,
  String categoryId, {
  ArchiveFilter filter = ArchiveFilter.active,
}) {
  return inspectionSubcategoryRepository.getInspectionSubcategories(
    sheetId,
    categoryId,
    filter: filter,
  );
}

@riverpod
Stream<InspectionSubcategory?> inspectionSubcategoryById(
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

@Riverpod(keepAlive: true)
class InspectionSubcategoryActions extends _$InspectionSubcategoryActions {
  @override
  FutureOr<void> build() {}

  Future<void> add(
    String sheetId,
    String categoryId,
    InspectionSubcategoryInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionSubcategoryRepository.addInspectionSubcategory(
      sheetId,
      categoryId,
      input,
      currentUser,
    );
  }

  Future<void> updateSubcategory(
    String sheetId,
    String categoryId,
    String subcategoryId,
    InspectionSubcategoryInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionSubcategoryRepository.updateInspectionSubcategory(
      sheetId,
      categoryId,
      subcategoryId,
      input,
      currentUser,
    );
  }

  Future<void> setArchived(
    String sheetId,
    InspectionSubcategory subcategory, {
    required bool archived,
  }) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionSubcategoryRepository.setInspectionSubcategoryArchived(
      sheetId,
      subcategory,
      currentUser,
      archived: archived,
    );
  }

  Future<void> reorder(
    String sheetId,
    String categoryId,
    List<String> orderedSubcategoryIds,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionSubcategoryRepository.reorderInspectionSubcategories(
      sheetId,
      categoryId,
      orderedSubcategoryIds,
      currentUser,
    );
  }
}
