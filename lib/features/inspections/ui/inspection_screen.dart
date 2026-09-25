import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_screen.dart';
import 'package:pit_check/features/inspections/ui/inspection_scaffold.dart';
import 'package:pit_check/features/inspections/ui/lobby/inspection_lobby_screen.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

const inspectionRouteName = 'inspection';

class InspectionScreen extends ConsumerWidget {
  const InspectionScreen({super.key, required this.inspectionId});

  final String inspectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspectionProvider = inspectionByIdProvider(inspectionId);
    final inspection = ref.watch(inspectionProvider);
    final loadedInspection = inspection.hasValue
        ? inspection.requireValue
        : null;

    return InspectionScaffold(
      inspectionId: inspectionId,
      title: _titleFor(loadedInspection),
      body: inspection.when(
        data: (value) {
          if (value == null) {
            return const EmptyView(
              icon: Icons.fact_check_outlined,
              title: 'Inspection not found',
              message: 'This inspection may have been cancelled or removed',
            );
          }

          return switch (value.lifecycle) {
            InspectionLifecycle.lobby => InspectionLobbyScreen(
              inspection: value,
            ),
            InspectionLifecycle.running || InspectionLifecycle.completed =>
              InspectionDetailsScreen(inspection: value),
          };
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load the inspection ($error)',
          onRetry: () => ref.invalidate(inspectionProvider),
        ),
      ),
    );
  }

  String _titleFor(Inspection? inspection) {
    if (inspection == null) return 'Inspection';

    return switch (inspection.lifecycle) {
      InspectionLifecycle.lobby => 'Inspection lobby',
      InspectionLifecycle.running => 'Live inspection',
      InspectionLifecycle.completed => 'Completed inspection',
    };
  }
}
