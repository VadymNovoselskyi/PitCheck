import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/repository/inspection_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_providers.g.dart';

final inspectionRepository = InspectionRepository();

@riverpod
Stream<List<Inspection>> inspections(Ref ref, {bool completed = false}) {
  return inspectionRepository.getInspections(completed: completed);
}

@riverpod
Stream<Inspection?> inspectionById(Ref ref, String inspectionId) {
  return inspectionRepository.getInspectionById(inspectionId);
}

@Riverpod(keepAlive: true)
class InspectionActions extends _$InspectionActions {
  @override
  FutureOr<void> build() {}

  Future<void> add(Inspection inspection) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionRepository.addInspection(inspection, currentUser);
  }

  Future<void> start(Inspection inspection) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionRepository.startInspection(inspection, currentUser);
  }

  Future<void> finish(Inspection inspection) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionRepository.finishInspection(inspection, currentUser);
  }

  Future<void> cancel(Inspection inspection) =>
      inspectionRepository.cancelInspection(inspection);
}
