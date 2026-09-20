import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
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

@Riverpod(keepAlive: true)
class InspectionPointEventActions extends _$InspectionPointEventActions {
  @override
  FutureOr<void> build() {}

  Future<void> recordDecision(
    String inspectionId,
    String scrutPointId,
    InspectionPointDecisionInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionPointEventRepository.recordDecision(
      inspectionId,
      scrutPointId,
      input,
      currentUser,
    );
  }

  Future<void> setAddressed(
    String inspectionId,
    String scrutPointId,
    InspectionPointStatus currentStatus,
    InspectionPointAddressInput input,
  ) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionPointEventRepository.setAddressed(
      inspectionId,
      scrutPointId,
      currentStatus,
      input,
      currentUser,
    );
  }
}
