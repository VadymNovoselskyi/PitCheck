import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_chip.dart';
import 'package:pit_check/shared/ui/time_format.dart';

class InspectionPointResultCurrentDecision extends StatelessWidget {
  const InspectionPointResultCurrentDecision({super.key, required this.result});

  final InspectionPointResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final judgeName = result.latestJudgeName?.trim();

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current result', style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),

            InspectionPointStatusChip(status: result.currentStatus),

            if (judgeName != null && judgeName.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('Judge: $judgeName'),
            ],

            if (result.latestDecisionAt != null) ...[
              const SizedBox(height: 4),
              Text(
                'Decision at: ${formatLocalDateTime(context, result.latestDecisionAt!)}',
              ),
            ] else if (result.latestJudgeId != null) ...[
              const SizedBox(height: 4),
              const Text('Decision time pending'),
            ],

            const SizedBox(height: 16),

            Text('Note', style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),

            Text(result.currentNote.isEmpty ? 'No note' : result.currentNote),
          ],
        ),
      ),
    );
  }
}
