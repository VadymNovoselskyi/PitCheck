import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/scrut_points/repository/inspection_point_event_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_point_event_providers.g.dart';

final inspectionPointEventRepository = InspectionPointEventRepository();

@riverpod
Stream<List<InspectionPointEvent>> inspectionPointEvents(
  Ref ref,
  String inspectionId,
  String scrutPointId,
) {
  return inspectionPointEventRepository.getInspectionPointEvents(
    inspectionId,
    scrutPointId,
  );
}

@riverpod
Future<void> addInspectionPointEvent(Ref ref, InspectionPointEvent event) {
  return inspectionPointEventRepository.addInspectionPointEvent(
    event,
    ref.read(currentUserProvider),
  );
}
