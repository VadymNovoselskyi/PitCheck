import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/features/users/models/user.dart';

class AuditMetadata {
  const new({
    required this.createdById,
    required this.createdByName,
    required this.createdAt,
    required this.updatedById,
    required this.updatedByName,
    required this.updatedAt,
  });

  factory AuditMetadata.localFor(User user, {DateTime? localTimestamp}) {
    final timestamp = localTimestamp ?? DateTime.now();

    return AuditMetadata(
      createdById: user.id,
      createdByName: user.fullName,
      createdAt: timestamp,
      updatedById: user.id,
      updatedByName: user.fullName,
      updatedAt: timestamp,
    );
  }

  final String createdById;
  final String createdByName;
  final DateTime? createdAt;
  final String updatedById;
  final String updatedByName;
  final DateTime? updatedAt;

  static Map<String, dynamic> createFields(User user) {
    return {
      'audit': {
        'createdById': user.id,
        'createdByName': user.fullName,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedById': user.id,
        'updatedByName': user.fullName,
        'updatedAt': FieldValue.serverTimestamp(),
      },
    };
  }

  static Map<String, dynamic> updateFields(User user) {
    return {
      'audit.updatedById': user.id,
      'audit.updatedByName': user.fullName,
      'audit.updatedAt': FieldValue.serverTimestamp(),
    };
  }

  factory AuditMetadata.fromFirestore(Map<String, dynamic> data) {
    return AuditMetadata(
      createdById: data['createdById'],
      createdByName: data['createdByName'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedById: data['updatedById'],
      updatedByName: data['updatedByName'],
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }
}
