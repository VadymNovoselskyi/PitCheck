import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionSetupReview extends ConsumerWidget {
  const InspectionSetupReview({
    super.key,
    required this.sheet,
    required this.category,
    required this.includedSubcategories,
    required this.onCreate,
  });

  final InspectionSheet sheet;
  final InspectionCategory category;
  final List<InspectionSubcategory> includedSubcategories;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointStates = [
      for (final subcategory in includedSubcategories)
        ref.watch(scrutPointsProvider(sheet.id, category.id, subcategory.id)),
    ];
    final pointError = pointStates.where((state) => state.hasError).firstOrNull;
    final isLoading = pointStates.any((state) => state.isLoading);
    final pointCount = pointStates
        .where((state) => state.hasValue)
        .fold(0, (count, state) => count + state.requireValue.length);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Review', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _ReviewRow(
              label: 'Sheet',
              value: '${sheet.competitionName} ${sheet.year}',
            ),
            _ReviewRow(label: 'Category', value: category.type.label),
            _ReviewRow(
              label: 'Subcategories',
              value: '${includedSubcategories.length} selected',
            ),

            if (pointError != null)
              InlineError(
                message: 'Could not count included points',
                onRetry: () => _retryPoints(ref),
              )
            else if (isLoading)
              const InlineLoading()
            else
              _ReviewRow(label: 'Scrut points', value: '$pointCount'),

            const SizedBox(height: 16),
            FilledButton(
              onPressed: onCreate,
              child: Text(
                'Create lobby',
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _retryPoints(WidgetRef ref) {
    for (final subcategory in includedSubcategories) {
      ref.invalidate(
        scrutPointsProvider(sheet.id, category.id, subcategory.id),
      );
    }
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
