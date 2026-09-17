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

@riverpod
Future<void> joinInspection(
  Ref ref,
  String inspectionId,
  InspectionMemberRole role,
) {
  return inspectionMemberRepository.joinInspection(
    inspectionId,
    role,
    ref.read(currentUserProvider),
  );
}
