import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class InspectionCategory {
  const new({
    required this.id,
    required this.inspectionSheetId,
    required this.type,
    required this.auditMetadata,
    this.order,
    this.archivedAt,
  });

  final String id;
  final String inspectionSheetId;
  final InspectionCategoryType type;
  final AuditMetadata auditMetadata;
  final int? order;
  final DateTime? archivedAt;

  bool get isArchived => archivedAt != null;

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionSheetId': inspectionSheetId,
      'type': type.name,
      'order': order,
      'archivedAt': archivedAt,
    };
  }

  factory InspectionCategory.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    return InspectionCategory(
      id: snapshot.id,
      inspectionSheetId: data['inspectionSheetId'],
      type: InspectionCategoryType.values.firstWhere(
        (t) => t.name == data['type'],
      ),
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
      order: data['order'],
      archivedAt: (data['archivedAt'] as Timestamp?)?.toDate(),
    );
  }
}

enum InspectionCategoryType {
  preInspection(
    name: "Pre-inspection",
    description: "Pre-inspection before the drive",
  ),
  postInspection(
    name: "Post-inspection",
    description: "Post-inspection after the drive",
  ),
  egress(name: "Egress", description: "Egress inspection"),
  accumulator(name: "Accumulator", description: "Accumulator inspection"),
  electrical(name: "Electrical", description: "Electrical inspection"),
  lv(name: "LV", description: "Low Voltage inspection"),
  mech(name: "Mech", description: "Mechanical inspection"),
  hv(name: "HV", description: "High Voltage inspection"),
  rain(name: "Rain Test", description: "Rain inspection"),
  tilt(name: "Tilt Test", description: "Tilt inspection");

  const new({required this.name, required this.description});

  final String name;
  final String description;
}
