import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/models/inspection_member.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/firestore_stream_helpers.dart';

class InspectionRepository {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _rawRef =>
      _firestore.collection('inspections');

  CollectionReference<Inspection> get _ref => _rawRef.withConverter(
    fromFirestore: Inspection.fromFirestore,
    toFirestore: (inspection, _) => inspection.toFirestore(),
  );

  Stream<List<Inspection>> getInspections({bool completed = false}) {
    return watchQuery(
      _ref,
      where: (inspection) => inspection.isCompleted == completed,
      compare: _compareInspections,
    );
  }

  Stream<Inspection?> getInspectionById(String id) {
    return watchDocument(_ref.doc(id));
  }

  Future<String> createLobby(
    CreateInspectionInput input,
    User currentUser,
  ) async {
    if (input.selectedSubcategoryIds.isEmpty) {
      throw ArgumentError('Select at least one subcategory');
    }

    final inspectionReference = _rawRef.doc();
    final memberReference = inspectionReference
        .collection('members')
        .doc(currentUser.id);
    final batch = _firestore.batch();

    batch.set(inspectionReference, {
      ...input.toFirestore(),
      ...AuditMetadata.createFields(currentUser),
    });
    batch.set(memberReference, {
      'inspectionId': inspectionReference.id,
      'userId': currentUser.id,
      'displayName': currentUser.fullName,
      'role': InspectionMemberRole.judge.name,
      'joinedAt': FieldValue.serverTimestamp(),
    });

    await batch.commit();
    return inspectionReference.id;
  }

  Future<void> startInspection(Inspection inspection, User currentUser) async {
    final subcategoryIds = await _activeSubcategoryIds(inspection);
    final activePoints = await _activePoints(inspection, subcategoryIds);

    final batch = _firestore.batch();
    batch.update(_rawRef.doc(inspection.id), {
      'startedAt': FieldValue.serverTimestamp(),
      ...AuditMetadata.updateFields(currentUser),
    });

    for (final point in activePoints) {
      final result = InspectionPointResult(
        id: point.id,
        inspectionId: inspection.id,
        scrutPointId: point.id,
        pointRef: point.reference.withConverter(
          fromFirestore: ScrutPoint.fromFirestore,
          toFirestore: (scrutPoint, _) => scrutPoint.toFirestore(),
        ),
        auditMetadata: AuditMetadata.localFor(currentUser),
        inspectionStartedAt: null,
        pointOrder: point.data()['order'] as int?,
      );

      batch.set(
        _rawRef.doc(inspection.id).collection('results').doc(point.id),
        {
          ...result.toFirestore(),
          'inspectionStartedAt': FieldValue.serverTimestamp(),
          ...AuditMetadata.createFields(currentUser),
        },
      );
    }

    await batch.commit();
  }

  Future<void> finishInspection(Inspection inspection, User currentUser) {
    return _rawRef.doc(inspection.id).update({
      'endedAt': FieldValue.serverTimestamp(),
      ...AuditMetadata.updateFields(currentUser),
    });
  }

  Future<void> cancelInspection(Inspection inspection) async {
    if (!inspection.isLobby) {
      throw StateError('Only a lobby inspection can be cancelled');
    }

    final memberDocuments = await _rawRef
        .doc(inspection.id)
        .collection('members')
        .get();

    final batch = _firestore.batch();
    for (final member in memberDocuments.docs) {
      batch.delete(member.reference);
    }
    batch.delete(_rawRef.doc(inspection.id));
    await batch.commit();
  }

  Future<List<String>> _activeSubcategoryIds(Inspection inspection) async {
    final subcategories = await _firestore
        .collection('inspectionSheets')
        .doc(inspection.inspectionSheetId)
        .collection('categories')
        .doc(inspection.categoryId)
        .collection('subcategories')
        .get();
    final activeIds = subcategories.docs
        .where((subcategory) => subcategory.data()['archivedAt'] == null)
        .map((subcategory) => subcategory.id)
        .toList();

    return activeIds.where(inspection.selectedSubcategoryIds.contains).toList();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> _activePoints(
    Inspection inspection,
    List<String> subcategoryIds,
  ) async {
    final snapshots = await Future.wait(
      subcategoryIds.map(
        (subcategoryId) => _firestore
            .collection('inspectionSheets')
            .doc(inspection.inspectionSheetId)
            .collection('categories')
            .doc(inspection.categoryId)
            .collection('subcategories')
            .doc(subcategoryId)
            .collection('points')
            .get(),
      ),
    );

    return snapshots
        .expand((snapshot) => snapshot.docs)
        .where((point) => point.data()['archivedAt'] == null)
        .toList();
  }

  static int _compareInspections(Inspection left, Inspection right) {
    final leftTime =
        left.endedAt ?? left.startedAt ?? left.auditMetadata.createdAt;
    final rightTime =
        right.endedAt ?? right.startedAt ?? right.auditMetadata.createdAt;
    if (leftTime == null && rightTime == null) {
      return right.id.compareTo(left.id);
    }
    if (leftTime == null) return 1;
    if (rightTime == null) return -1;
    return rightTime.compareTo(leftTime);
  }
}
