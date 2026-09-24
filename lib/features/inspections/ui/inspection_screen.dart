import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/lobby/inspection_lobby_screen.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

const inspectionRouteName = 'inspection';

class InspectionScreen extends ConsumerWidget {
  const InspectionScreen({super.key, required this.inspectionId});

  final String inspectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspection = ref.watch(inspectionByIdProvider(inspectionId));
    final loadedInspection = inspection.hasValue
        ? inspection.requireValue
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(_titleFor(loadedInspection))),
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
            InspectionLifecycle.running => const Text(
              'Judge view for the inspection TBI',
            ),
            InspectionLifecycle.completed => const Text(
              'Inspection details TBI',
            ),
          };
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load the inspection ($error)',
          onRetry: () => ref.invalidate(inspectionByIdProvider(inspectionId)),
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
