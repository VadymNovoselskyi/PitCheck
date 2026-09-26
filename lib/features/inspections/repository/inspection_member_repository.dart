import 'package:cloud_firestore/cloud_firestore.dart';

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
    String inspectionId,
    InspectionMemberRole role,
    User currentUser,
  ) {
    final inspectionRef = _firestore
        .collection('inspections')
        .doc(inspectionId);
    final memberRef = _rawRef(inspectionId).doc(currentUser.id);

    return _firestore.runTransaction<void>((transaction) async {
      final inspection = await transaction.get(inspectionRef);
      if (!inspection.exists) {
        throw StateError('Inspection not found');
      }
      if (inspection.data()?['endedAt'] != null) {
        throw StateError('Cannot join a completed inspection');
      }

      final member = await transaction.get(memberRef);
      if (member.exists) return;

      transaction.set(memberRef, {
        'inspectionId': inspectionId,
        'userId': currentUser.id,
        'displayName': currentUser.fullName,
        'image': currentUser.image,
        'role': role.name,
        'joinedAt': FieldValue.serverTimestamp(),
      });
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
