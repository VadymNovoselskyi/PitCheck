import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';

class InspectionPointEvent {
  const new({
    required this.id,
    required this.inspectionId,
    required this.scrutPointId,
    required this.type,
    required this.status,
    required this.actorId,
    required this.actorName,
    required this.occurredAt,
    this.comment = '',
    this.attachmentUrls = const [],
  });

  final String id;
  final String inspectionId;
  final String scrutPointId;

  final InspectionPointEventType type;
  final InspectionPointStatus status;
  final String actorId;
  final String actorName;
  final String comment;
  final List<String> attachmentUrls;

  /// Null while a Firestore server timestamp is still pending locally.
  final DateTime? occurredAt;

  Map<String, dynamic> toFirestore() {
    return {
      'inspectionId': inspectionId,
      'scrutPointId': scrutPointId,
      'type': type.name,
      'status': status.name,
      'actorId': actorId,
      'actorName': actorName,
      'comment': comment,
      'attachmentUrls': attachmentUrls,
    };
  }

  factory InspectionPointEvent.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    return InspectionPointEvent(
      id: snapshot.id,
      inspectionId: data['inspectionId'],
      scrutPointId: data['scrutPointId'],
      type: InspectionPointEventType.values.byName(data['type']),
      status: InspectionPointStatus.values.byName(data['status']),
      actorId: data['actorId'],
      actorName: data['actorName'],
      comment: data['comment'] ?? '',
      attachmentUrls: List<String>.from(data['attachmentUrls'] ?? const []),
      occurredAt: (data['occurredAt'] as Timestamp?)?.toDate(),
    );
  }
}

enum InspectionPointEventType { decision, markedAddressed, markedUnaddressed }
