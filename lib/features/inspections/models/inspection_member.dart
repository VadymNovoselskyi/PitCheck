import 'package:cloud_firestore/cloud_firestore.dart';

class InspectionMember {
  const new({
    required this.id,
    required this.inspectionId,
    required this.userId,
    required this.displayName,
    required this.role,
    required this.joinedAt,
  });

  final String id;
  final String inspectionId;
  final String userId;
  final String displayName;
  final InspectionMemberRole role;

  /// Null while a Firestore server timestamp is still pending locally.
  final DateTime? joinedAt;

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionId': inspectionId,
      'userId': userId,
      'displayName': displayName,
      'role': role.name,
      'joinedAt': joinedAt,
    };
  }

  factory InspectionMember.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('InspectionMember document does not exist');
    }

    return InspectionMember(
      id: snapshot.id,
      inspectionId: data['inspectionId'],
      userId: data['userId'],
      displayName: data['displayName'],
      role: InspectionMemberRole.values.byName(data['role']),
      joinedAt: (data['joinedAt'] as Timestamp?)?.toDate(),
    );
  }
}

enum InspectionMemberRole { judge, participant }
