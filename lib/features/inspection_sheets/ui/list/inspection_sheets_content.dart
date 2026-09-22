import 'package:flutter/material.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/ui/list/inspection_sheet_card.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';

class InspectionSheetsContent extends StatelessWidget {
  const InspectionSheetsContent({
    super.key,
    required this.sheets,
    required this.showArchived,
    required this.onEdit,
    required this.onToggleArchived,
  });

  final List<InspectionSheet> sheets;
  final bool showArchived;
  final ValueChanged<InspectionSheet> onEdit;
  final ValueChanged<InspectionSheet> onToggleArchived;

  @override
  Widget build(BuildContext context) {
    if (sheets.isEmpty) {
      return EmptyView(
        icon: showArchived ? Icons.archive_outlined : Icons.checklist_outlined,
        title: showArchived ? 'No archived sheets' : 'No inspection sheets yet',
        message: showArchived
            ? 'Archived inspection sheets will appear here'
            : 'Add a competition inspection sheet to get started',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemCount: sheets.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final sheet = sheets[index];
        return InspectionSheetCard(
          sheet: sheet,
          onEdit: onEdit,
          onToggleArchived: onToggleArchived,
        );
      },
    );
  }
}
