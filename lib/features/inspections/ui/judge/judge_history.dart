import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_event.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_chip.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';
import 'package:pit_check/shared/ui/time_format.dart';

class JudgeHistory extends StatelessWidget {
  const JudgeHistory({super.key, required this.events, required this.onRetry});

  final AsyncValue<List<InspectionPointEvent>> events;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Change history', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),

        events.when(
          data: (items) {
            final decisions = items
                .where((item) => item.type == InspectionPointEventType.decision)
                .toList();
            if (decisions.isEmpty) {
              return const InlineEmpty(message: 'No changes recorded yet');
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var index = decisions.length - 1; index >= 0; index--)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Decision recorded'),
                          const SizedBox(height: 4),

                          InspectionPointStatusChip(
                            status: decisions[index].status,
                          ),
                          const SizedBox(height: 4),

                          if (decisions[index].comment.isNotEmpty) ...[
                            Text(decisions[index].comment),
                            const SizedBox(height: 4),
                          ],

                          Text(
                            '${decisions[index].actorName} · '
                            '${decisions[index].occurredAt == null ? 'Time pending' : formatLocalDateTime(context, decisions[index].occurredAt!)}',
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },

          loading: () => const InlineLoading(),
          error: (error, _) => InlineError(
            message: 'Could not load change history ($error)',
            onRetry: onRetry,
          ),
        ),
      ],
    );
  }
}
