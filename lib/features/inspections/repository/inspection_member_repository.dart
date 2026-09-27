import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionMemberRepository {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _rawRef(String inspectionId) {
    return _firestore
        .collection('inspections')
        .doc(inspectionId)
        .collection('members');
  }

  CollectionReference<InspectionMember> _ref(String inspectionId) {
    return _rawRef(inspectionId).withConverter(
      fromFirestore: InspectionMember.fromFirestore,
      toFirestore: (member, _) => member.toFirestore(),
    );
  }

  Stream<List<InspectionMember>> getInspectionMembers(String inspectionId) {
    return watchQuery(_ref(inspectionId), compare: _compareMembers);
  }

  Stream<InspectionMember?> getInspectionMemberByUserId(
    String inspectionId,
    String userId,
  ) {
    return watchDocument(_ref(inspectionId).doc(userId));
  }

  Future<void> joinInspection(
    Inspection inspection,
    InspectionMemberRole role,
    User currentUser,
  ) async {
    if (inspection.isCompleted) {
      throw StateError('Cannot join a completed inspection');
    }

    final memberRef = _rawRef(inspection.id).doc(currentUser.id);
    final member = await memberRef.get();
    if (member.exists) return;

    await memberRef.set({
      'inspectionId': inspection.id,
      'userId': currentUser.id,
      'displayName': currentUser.fullName,
      'image': currentUser.image,
      'role': role.name,
      'joinedAt': FieldValue.serverTimestamp(),
    });
  }

  static int _compareMembers(InspectionMember left, InspectionMember right) {
    final leftJoinedAt = left.joinedAt;
    final rightJoinedAt = right.joinedAt;
    if (leftJoinedAt == null && rightJoinedAt == null) {
      return left.displayName.compareTo(right.displayName);
    }
    if (leftJoinedAt == null) return 1;
    if (rightJoinedAt == null) return -1;
    return leftJoinedAt.compareTo(rightJoinedAt);
  }
}
