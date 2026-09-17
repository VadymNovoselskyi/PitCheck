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

@riverpod
Future<void> addInspection(Ref ref, Inspection inspection) {
  return inspectionRepository.addInspection(
    inspection,
    ref.read(currentUserProvider),
  );
}

@riverpod
Future<void> startInspection(Ref ref, Inspection inspection) {
  return inspectionRepository.startInspection(
    inspection,
    ref.read(currentUserProvider),
  );
}

@riverpod
Future<void> finishInspection(Ref ref, Inspection inspection) {
  return inspectionRepository.finishInspection(
    inspection,
    ref.read(currentUserProvider),
  );
}

@riverpod
Future<void> cancelInspection(Ref ref, Inspection inspection) {
  return inspectionRepository.cancelInspection(inspection);
}
