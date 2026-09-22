import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point_history.dart';
import 'package:pit_check/features/scrut_points/repository/inspection_point_result_repository.dart';

part 'inspection_point_result_providers.g.dart';

final inspectionPointResultRepository = InspectionPointResultRepository();

@riverpod
Stream<List<InspectionPointResult>> inspectionPointResults(
  Ref ref,
  String inspectionId,
) {
  return inspectionPointResultRepository.getInspectionPointResults(
    inspectionId,
  );
}

@riverpod
Stream<InspectionPointResult?> inspectionPointResultByPointId(
  Ref ref,
  String inspectionId,
  String scrutPointId,
) {
  return inspectionPointResultRepository.getInspectionPointResultByPointId(
    inspectionId,
    scrutPointId,
  );
}

@riverpod
Stream<ScrutPointHistory> scrutPointHistory(
  Ref ref,
  String sheetId,
  String categoryId,
  String subcategoryId,
  String pointId,
) {
  return inspectionPointResultRepository
      .getResultsForScrutPoint(sheetId, categoryId, subcategoryId, pointId)
      .map(ScrutPointHistory.fromResults);
}
