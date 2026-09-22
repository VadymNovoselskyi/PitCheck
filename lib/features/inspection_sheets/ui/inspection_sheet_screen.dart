import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspection_sheets/ui/components/inspection_sheet_content.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class InspectionSheetScreen extends ConsumerWidget {
  const new({super.key, required this.sheetId});

  final String sheetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheet = ref.watch(inspectionSheetByIdProvider(sheetId));

    return Scaffold(
      appBar: AppBar(title: const Text('Inspection Sheet Details')),
      body: sheet.when(
        data: (value) => value == null
            ? const EmptyView(
                icon: Icons.checklist_outlined,
                title: 'Inspection sheet not found',
                message: 'This inspection sheet may have been removed',
              )
            : InspectionSheetContent(sheet: value),

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load the inspection sheet ($error)',
          onRetry: () => ref.invalidate(inspectionSheetByIdProvider(sheetId)),
        ),
      ),
    );
  }
}
