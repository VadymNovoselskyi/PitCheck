import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point_history.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_chip.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_details_screen.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';
import 'package:pit_check/shared/ui/time_format.dart';

class ScrutPointResults extends StatelessWidget {
  const ScrutPointResults({
    super.key,
    required this.history,
    required this.onRetry,
  });

  final AsyncValue<ScrutPointHistory> history;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return history.when(
      data: (value) {
        if (value.results.isEmpty) {
          return const EmptyView(
            icon: Icons.history_outlined,
            title: 'No previous results',
            message: 'No previous inspection results for this point',
          );
        }

        return ListView.separated(
          key: const PageStorageKey<String>('scrut-point-results'),
          padding: const EdgeInsets.all(12),
          itemCount: value.results.length,
          itemBuilder: (context, index) =>
              _ResultCard(result: value.results[index]),
          separatorBuilder: (_, _) => const SizedBox(height: 8),
        );
      },

      loading: () => const Center(child: CircularProgressIndicator()),

      error: (_, _) => ErrorView(
        title: 'Could not load previous results',
        message: 'Could not load previous results',
        onRetry: onRetry,
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.result});

  final InspectionPointResult result;

  @override
  Widget build(BuildContext context) {
    final judgeName = result.latestJudgeName?.trim();

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.pushNamed(
          inspectionPointResultRouteName,
          pathParameters: {
            'inspectionId': result.inspectionId,
            'pointId': result.scrutPointId,
          },
        ),
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
                      result.inspectionStartedAt == null
                          ? 'Inspection date pending'
                          : formatLocalDateTime(
                              context,
                              result.inspectionStartedAt!,
                            ),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 12),
                  InspectionPointStatusChip(status: result.currentStatus),
                ],
              ),
              if (judgeName != null && judgeName.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text('Latest judge: $judgeName'),
              ],
              if (result.latestDecisionAt != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Latest decision: '
                  '${formatLocalDateTime(context, result.latestDecisionAt!)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
              if (result.isAddressed) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.build_circle_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      'Addressed',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
