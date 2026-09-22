import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';

class InspectionSheetCard extends StatelessWidget {
  const InspectionSheetCard({
    super.key,
    required this.sheet,
    required this.onEdit,
    required this.onToggleArchived,
  });

  final InspectionSheet sheet;
  final ValueChanged<InspectionSheet> onEdit;
  final ValueChanged<InspectionSheet> onToggleArchived;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/sheets/${sheet.id}'),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 4, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${sheet.competitionName} | ${sheet.year}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              PopupMenuButton<_SheetAction>(
                tooltip: 'Sheet actions',
                onSelected: (action) {
                  switch (action) {
                    case _SheetAction.edit:
                      onEdit(sheet);
                    case _SheetAction.toggleArchived:
                      onToggleArchived(sheet);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: _SheetAction.edit,
                    child: ListTile(
                      leading: Icon(Icons.edit_outlined),
                      title: Text('Edit'),
                    ),
                  ),

                  PopupMenuItem(
                    value: _SheetAction.toggleArchived,
                    child: ListTile(
                      leading: Icon(
                        sheet.isArchived
                            ? Icons.unarchive_outlined
                            : Icons.archive_outlined,
                      ),
                      title: Text(sheet.isArchived ? 'Restore' : 'Archive'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _SheetAction { edit, toggleArchived }
