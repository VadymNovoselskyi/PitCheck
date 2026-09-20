import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/scrut_points/repository/scrut_point_repository.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'scrut_point_providers.g.dart';

final scrutPointRepository = ScrutPointRepository();

@riverpod
Stream<List<ScrutPoint>> scrutPoints(
  Ref ref,
  String sheetId,
  String categoryId,
  String subcategoryId, {
  bool archived = false,
}) {
  return scrutPointRepository.getScrutPoints(
    sheetId,
    categoryId,
    subcategoryId,
    archived: archived,
  );
}

@riverpod
Stream<ScrutPoint?> scrutPointById(
  Ref ref,
  String sheetId,
  String categoryId,
  String subcategoryId,
  String pointId,
) {
  return scrutPointRepository.getScrutPointById(
    sheetId,
    categoryId,
    subcategoryId,
    pointId,
  );
}

@Riverpod(keepAlive: true)
class ScrutPointActions extends _$ScrutPointActions {
  @override
  FutureOr<void> build() {}

  Future<void> add(
    String sheetId,
    String categoryId,
    String subcategoryId,
    ScrutPointInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return scrutPointRepository.addScrutPoint(
      sheetId,
      categoryId,
      subcategoryId,
      input,
      currentUser,
    );
  }

  Future<void> updatePoint(
    String sheetId,
    String categoryId,
    String subcategoryId,
    String pointId,
    ScrutPointInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return scrutPointRepository.updateScrutPoint(
      sheetId,
      categoryId,
      subcategoryId,
      pointId,
      input,
      currentUser,
    );
  }

  Future<void> setArchived(
    String sheetId,
    String categoryId,
    ScrutPoint point, {
    required bool archived,
  }) {
    final currentUser = ref.read(currentUserProvider);
    return scrutPointRepository.setScrutPointArchived(
      sheetId,
      categoryId,
      point,
      currentUser,
      archived: archived,
    );
  }

  Future<void> reorder(
    String sheetId,
    String categoryId,
    String subcategoryId,
    List<String> orderedPointIds,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return scrutPointRepository.reorderScrutPoints(
      sheetId,
      categoryId,
      subcategoryId,
      orderedPointIds,
      currentUser,
    );
  }
}
