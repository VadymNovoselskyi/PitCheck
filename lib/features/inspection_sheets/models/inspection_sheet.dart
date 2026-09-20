import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class InspectionSheet {
  const new({
    required this.id,
    required this.competitionName,
    required this.year,
    required this.description,
    this.sourceUrl,
    required this.auditMetadata,
    this.archivedAt,
  });

  final String id;
  final String competitionName;
  final int year;
  final String description;
  final String? sourceUrl;
  final AuditMetadata auditMetadata;
  final DateTime? archivedAt;

  bool get isArchived => archivedAt != null;

  InspectionSheetInput toInput() {
    return InspectionSheetInput(
      competitionName: competitionName,
      year: year,
      description: description,
      sourceUrl: sourceUrl,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {...toInput().toFirestore(), 'archivedAt': archivedAt};
  }

  factory InspectionSheet.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    return InspectionSheet(
      id: snapshot.id,
      competitionName: data['competitionName'],
      year: data['year'],
      description: data['description'],
      sourceUrl: data['sourceUrl'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
      archivedAt: (data['archivedAt'] as Timestamp?)?.toDate(),
    );
  }
}

class InspectionSheetInput {
  const new({
    required this.competitionName,
    required this.year,
    required this.description,
    required this.sourceUrl,
  });

  final String competitionName;
  final int year;
  final String description;
  final String? sourceUrl;

  Map<String, dynamic> toFirestore() {
    return {
      'competitionName': competitionName,
      'year': year,
      'description': description,
      'sourceUrl': sourceUrl,
    };
  }
}
