import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/inspection_screen.dart';
import 'package:pit_check/features/inspections/ui/setup/start_inspection_form.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

const startInspectionRouteName = 'start-inspection';

class StartInspectionScreen extends ConsumerWidget {
  const StartInspectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheets = ref.watch(inspectionSheetsProvider());

    return Scaffold(
      appBar: AppBar(title: const Text('Start inspection')),
      body: sheets.when(
        data: (items) => items.isEmpty
            ? const EmptyView(
                icon: Icons.checklist_outlined,
                title: 'No inspection sheets',
                message: 'Create an active inspection sheet before starting',
              )
            : StartInspectionForm(
                sheets: items,
                onSubmit: (input) => _createLobby(context, ref, input),
              ),

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load inspection sheets ($error)',
          onRetry: () => ref.invalidate(inspectionSheetsProvider()),
        ),
      ),
    );
  }

  Future<void> _createLobby(
    BuildContext context,
    WidgetRef ref,
    CreateInspectionInput input,
  ) async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      final inspectionId = await ref
          .read(inspectionActionsProvider.notifier)
          .createLobby(input);

      if (!context.mounted) return;
      context.goNamed(
        inspectionRouteName,
        pathParameters: {'inspectionId': inspectionId},
      );
    } catch (_) {
      showAppSnackBar(messenger, 'Could not create the inspection lobby');
    }
  }
}
