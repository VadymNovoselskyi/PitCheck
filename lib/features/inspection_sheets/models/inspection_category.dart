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

  InspectionCategoryInput toInput() {
    return InspectionCategoryInput(type: type);
  }

  Map<String, dynamic> toFirestore() {
    return {
      ...toInput().toFirestore(),
      'inspectionSheetId': inspectionSheetId,
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

class InspectionCategoryInput {
  const new({required this.type});

  final InspectionCategoryType type;

  Map<String, dynamic> toFirestore() {
    return {'type': type.name};
  }
}

enum InspectionCategoryType {
  preInspection(label: "Pre-inspection"),
  postInspection(label: "Post-inspection"),
  egress(label: "Egress"),
  accumulator(label: "Accumulator"),
  electrical(label: "Electrical"),
  lv(label: "LV"),
  mech(label: "Mech"),
  hv(label: "HV"),
  rain(label: "Rain Test"),
  brake(label: "Brake Test"),
  tilt(label: "Tilt Test");

  const new({required this.label});

  final String label;
}
