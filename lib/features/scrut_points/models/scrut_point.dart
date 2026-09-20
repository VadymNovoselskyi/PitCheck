import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class ScrutPoint {
  const new({
    required this.id,
    required this.subcategoryId,
    required this.name,
    required this.auditMetadata,
    this.description = '',
    this.order,
    this.archivedAt,
  });

  final String id;
  final String subcategoryId;
  final String name;
  final String description;
  final AuditMetadata auditMetadata;
  final DateTime? archivedAt;

  bool get isArchived => archivedAt != null;

  final int? order;

  ScrutPointInput toInput() {
    return ScrutPointInput(name: name, description: description);
  }

  Map<String, dynamic> toFirestore() {
    return {
      ...toInput().toFirestore(),
      'subcategoryId': subcategoryId,
      'order': order,
      'archivedAt': archivedAt,
    };
  }

  factory ScrutPoint.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    return ScrutPoint(
      id: snapshot.id,
      subcategoryId: data['subcategoryId'],
      name: data['name'],
      description: data['description'],
      order: data['order'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
      archivedAt: (data['archivedAt'] as Timestamp?)?.toDate(),
    );
  }
}

class ScrutPointInput {
  const new({required this.name, this.description = ''});

  final String name;
  final String description;

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'description': description};
  }
}
