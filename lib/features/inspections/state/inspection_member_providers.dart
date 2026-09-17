import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/inspections/repository/inspection_member_repository.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

part 'inspection_member_providers.g.dart';

final inspectionMemberRepository = InspectionMemberRepository();

@riverpod
Stream<List<InspectionMember>> inspectionMembers(Ref ref, String inspectionId) {
  return inspectionMemberRepository.getInspectionMembers(inspectionId);
}

@riverpod
Stream<InspectionMember?> inspectionMemberByUserId(
  Ref ref,
  String inspectionId,
  String userId,
) {
  return inspectionMemberRepository.getInspectionMemberByUserId(
    inspectionId,
    userId,
  );
}

@Riverpod(keepAlive: true)
class InspectionMemberActions extends _$InspectionMemberActions {
  @override
  FutureOr<void> build() {}

  Future<void> join(String inspectionId, InspectionMemberRole role) {
    final currentUser = ref.read(currentUserProvider);
    return inspectionMemberRepository.joinInspection(
      inspectionId,
      role,
      currentUser,
    );
  }
}
