import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class InspectionSubcategory {
  const new({
    required this.id,
    required this.inspectionCategoryId,
    required this.name,
    required this.description,
    required this.auditMetadata,
    this.order,
  });

  final String id;
  final String inspectionCategoryId;
  final String name;
  final String description;
  final AuditMetadata auditMetadata;

  // Index in its category
  final int? order;

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionCategoryId': inspectionCategoryId,
      'name': name,
      'description': description,
      'order': order,
    };
  }

  factory InspectionSubcategory.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('InspectionSubcategory document does not exist');
    }

    return InspectionSubcategory(
      id: snapshot.id,
      inspectionCategoryId: data['inspectionCategoryId'],
      name: data['name'],
      description: data['description'],
      order: data['order'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
    );
  }
}
