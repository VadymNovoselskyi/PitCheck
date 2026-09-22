import 'package:flutter/material.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';

class InspectionSheetHeader extends StatelessWidget {
  const InspectionSheetHeader({super.key, required this.sheet});

  final InspectionSheet sheet;

  @override
  Widget build(BuildContext context) {
    final sourceUrl = sheet.sourceUrl?.trim();

    return Card(
      //  A little bit darker blue for contrast with the white text, but still blue
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${sheet.competitionName} ${sheet.year}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (sheet.isArchived)
                  Chip(
                    avatar: Icon(Icons.archive_outlined, size: 20),
                    label: Text('Archived'),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              sheet.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            if (sourceUrl != null && sourceUrl.isNotEmpty) ...[
              const SizedBox(height: 6),
              const Divider(height: 2),
              const SizedBox(height: 6),
              Text(
                'Source URL:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              SelectableText(sourceUrl),
            ],
          ],
        ),
      ),
    );
  }
}
