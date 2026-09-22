import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';

class InspectionPointResult {
  const new({
    required this.id,
    required this.inspectionId,
    required this.scrutPointId,
    required this.pointRef,
    required this.auditMetadata,
    required this.inspectionStartedAt,
    required this.pointOrder,
    this.currentStatus = InspectionPointStatus.pending,
    this.latestJudgeId,
    this.latestJudgeName,
    this.latestDecisionAt,
    this.isAddressed = false,
    this.addressedNote = '',
  });

  final String id;
  final String inspectionId;
  final String scrutPointId;
  final DocumentReference<ScrutPoint> pointRef;
  final AuditMetadata auditMetadata;
  final DateTime? inspectionStartedAt;
  final int? pointOrder;

  final InspectionPointStatus currentStatus;
  final String? latestJudgeId;
  final String? latestJudgeName;
  final DateTime? latestDecisionAt;

  final bool isAddressed;
  final String addressedNote;

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionId': inspectionId,
      'scrutPointId': scrutPointId,
      'pointRef': pointRef,
      'inspectionStartedAt': inspectionStartedAt,
      'pointOrder': pointOrder,
      'currentStatus': currentStatus.name,
      'latestJudgeId': latestJudgeId,
      'latestJudgeName': latestJudgeName,
      'isAddressed': isAddressed,
      'addressedNote': addressedNote,
    };
  }

  factory InspectionPointResult.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    final rawPointRef =
        data['pointRef'] as DocumentReference<Map<String, dynamic>>;

    return InspectionPointResult(
      id: snapshot.id,
      inspectionId: data['inspectionId'],
      scrutPointId: data['scrutPointId'],
      pointRef: rawPointRef.withConverter(
        fromFirestore: ScrutPoint.fromFirestore,
        toFirestore: (point, _) => point.toFirestore(),
      ),
      auditMetadata: AuditMetadata.fromFirestore(data['audit']),
      inspectionStartedAt: (data['inspectionStartedAt'] as Timestamp?)
          ?.toDate(),
      pointOrder: data['pointOrder'] as int?,
      currentStatus: InspectionPointStatus.values.byName(data['currentStatus']),
      latestJudgeId: data['latestJudgeId'],
      latestJudgeName: data['latestJudgeName'],
      latestDecisionAt: (data['latestDecisionAt'] as Timestamp?)?.toDate(),
      isAddressed: data['isAddressed'] ?? false,
      addressedNote: data['addressedNote'] ?? '',
    );
  }
}
