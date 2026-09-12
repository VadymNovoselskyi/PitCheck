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
  });

  final String id;
  final String competitionName;
  final int year;
  final String description;
  final String? sourceUrl;
  final AuditMetadata auditMetadata;

  Map<String, dynamic> toFirestore() {
    return {
      'competitionName': competitionName,
      'year': year,
      'description': description,
      'sourceUrl': sourceUrl,
    };
  }

  factory InspectionSheet.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('InspectionSheet document does not exist');
    }

    return InspectionSheet(
      id: snapshot.id,
      competitionName: data['competitionName'],
      year: data['year'],
      description: data['description'],
      sourceUrl: data['sourceUrl'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
    );
  }
}
