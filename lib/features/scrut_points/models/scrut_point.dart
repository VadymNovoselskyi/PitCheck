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
  });

  final String id;
  final String subcategoryId;
  final String name;
  final String description;
  final AuditMetadata auditMetadata;

  final int? order;

  Map<String, dynamic> toFirestore() {
    return {
      'subcategoryId': subcategoryId,
      'name': name,
      'description': description,
      'order': order,
    };
  }

  factory ScrutPoint.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('ScrutPoint document does not exist');
    }

    return ScrutPoint(
      id: snapshot.id,
      subcategoryId: data['subcategoryId'],
      name: data['name'],
      description: data['description'],
      order: data['order'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
    );
  }
}
