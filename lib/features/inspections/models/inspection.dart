import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class Inspection {
  const new({
    required this.id,
    required this.inspectionSheetId,
    required this.categoryId,
    required this.auditMetadata,
    this.selectedSubcategoryIds = const [],
    this.startedAt,
    this.endedAt,
  });

  final String id;
  final String inspectionSheetId;
  final String categoryId;
  final AuditMetadata auditMetadata;
  final List<String> selectedSubcategoryIds;

  /// Null while the start server timestamp is pending locally.
  final DateTime? startedAt;

  /// Null until the inspection is completed.
  final DateTime? endedAt;

  InspectionLifecycle get lifecycle {
    if (endedAt != null) {
      return InspectionLifecycle.completed;
    }
    if (startedAt != null) {
      return InspectionLifecycle.running;
    }
    return InspectionLifecycle.lobby;
  }

  bool get isLobby => lifecycle == InspectionLifecycle.lobby;
  bool get isRunning => lifecycle == InspectionLifecycle.running;
  bool get isCompleted => lifecycle == InspectionLifecycle.completed;

  Duration? elapsedAt(DateTime now) {
    final start = startedAt;
    if (start == null) {
      return null;
    }

    return (endedAt ?? now).difference(start);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionSheetId': inspectionSheetId,
      'categoryId': categoryId,
      // An empty list includes every subcategory in the selected category.
      'selectedSubcategoryIds': selectedSubcategoryIds,
    };
  }

  factory Inspection.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('Inspection document does not exist');
    }

    return Inspection(
      id: snapshot.id,
      inspectionSheetId: data['inspectionSheetId'],
      categoryId: data['categoryId'],
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
      selectedSubcategoryIds: List<String>.from(
        data['selectedSubcategoryIds'] ?? const [],
      ),
      startedAt: (data['startedAt'] as Timestamp?)?.toDate(),
      endedAt: (data['endedAt'] as Timestamp?)?.toDate(),
    );
  }
}

enum InspectionLifecycle { lobby, running, completed }
