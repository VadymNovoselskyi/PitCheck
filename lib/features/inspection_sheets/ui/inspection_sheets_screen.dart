import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspection_sheets/ui/components/inspection_sheet_form.dart';
import 'package:pit_check/features/inspection_sheets/ui/components/inspection_sheets_content.dart';
import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/audit_metadata_model.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class InspectionSheetsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<InspectionSheetsScreen> createState() =>
      _InspectionSheetsScreenState();
}

class _InspectionSheetsScreenState
    extends ConsumerState<InspectionSheetsScreen> {
  bool showArchived = false;

  @override
  Widget build(BuildContext context) {
    final sheets = ref.watch(inspectionSheetsProvider(archived: showArchived));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${showArchived ? "Archived" : "Active"} Inspection Sheets',
        ),
        actions: [
          IconButton(
            tooltip: showArchived
                ? 'Show active sheets'
                : 'Show archived sheets',
            onPressed: () => setState(() => showArchived = !showArchived),
            icon: Icon(
              showArchived ? Icons.checklist_outlined : Icons.archive_outlined,
            ),
          ),
        ],
      ),

      body: sheets.when(
        data: (items) => InspectionSheetsContent(
          sheets: items,
          showArchived: showArchived,
          onEdit: _showSheetForm,
          onToggleArchived: _confirmArchive,
        ),

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load inspection sheets ($error)',
          onRetry: () =>
              ref.refresh(inspectionSheetsProvider(archived: showArchived)),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showSheetForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showSheetForm([InspectionSheet? sheet]) async {
    final result = await showModalBottomSheet<InspectionSheetFormData>(
      context: context,
      isScrollControlled: true,
      builder: (context) => InspectionSheetForm(sheet: sheet),
    );

    if (result == null || !mounted) return;

    final currentUser = ref.read(currentUserProvider);
    final updatedSheet = InspectionSheet(
      id: sheet?.id ?? '',
      competitionName: result.competitionName,
      year: result.year,
      description: result.description,
      sourceUrl: result.sourceUrl,
      auditMetadata:
          sheet?.auditMetadata ?? AuditMetadata.localFor(currentUser),
      archivedAt: sheet?.archivedAt,
    );

    try {
      if (sheet == null) {
        await ref
            .read(inspectionSheetActionsProvider.notifier)
            .add(updatedSheet);
      } else {
        await ref
            .read(inspectionSheetActionsProvider.notifier)
            .updateSheet(updatedSheet);
      }
      _showMessage(sheet == null ? 'Inspection sheet added' : 'Changes saved');
    } catch (_) {
      _showMessage('Could not save the inspection sheet');
    }
  }

  Future<void> _confirmArchive(InspectionSheet sheet) async {
    final archive = !sheet.isArchived;
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(archive ? 'Archive sheet?' : 'Restore sheet?'),
            content: Text(
              archive
                  ? '${sheet.competitionName} ${sheet.year} will be hidden from active sheets and new inspections'
                  : '${sheet.competitionName} ${sheet.year} will be available as an active sheet again',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(archive ? 'Archive' : 'Restore'),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed || !mounted) return;

    try {
      await ref
          .read(inspectionSheetActionsProvider.notifier)
          .setArchived(sheet, archived: archive);
      _showMessage('Inspection sheet ${archive ? 'archived' : 'restored'}');
    } catch (_) {
      _showMessage('Could not ${archive ? 'archive' : 'restore'} the sheet');
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
