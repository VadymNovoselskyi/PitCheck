import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point_history.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_chip.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class ScrutPointSummary extends StatelessWidget {
  const ScrutPointSummary({
    super.key,
    required this.history,
    required this.onRetry,
  });

  final AsyncValue<ScrutPointHistory> history;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return history.when(
      data: (value) => ListView(
        key: const PageStorageKey<String>('scrut-point-summary'),
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  label: 'Inspections',
                  value: value.inspectionCount.toString(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCard(
                  label: 'Attempted',
                  value: value.attemptedCount.toString(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCard(
                  label: 'Pass rate',
                  value: value.passRate == null
                      ? '—'
                      : '${(value.passRate! * 100).round()}%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Status breakdown',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              InspectionPointStatusChip(
                status: InspectionPointStatus.passed,
                count: value.passed,
              ),
              InspectionPointStatusChip(
                status: InspectionPointStatus.failed,
                count: value.failed,
              ),
              InspectionPointStatusChip(
                status: InspectionPointStatus.skipped,
                count: value.skipped,
              ),
              InspectionPointStatusChip(
                status: InspectionPointStatus.notApplicable,
                count: value.notApplicable,
              ),
              InspectionPointStatusChip(
                status: InspectionPointStatus.pending,
                count: value.pending,
              ),
            ],
          ),
        ],
      ),

      loading: () => const Center(child: CircularProgressIndicator()),

      error: (_, _) => ErrorView(
        title: 'Could not load summary',
        message: 'Could not load point summary.',
        onRetry: onRetry,
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
