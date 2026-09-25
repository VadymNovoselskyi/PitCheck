import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/shared/archive_filter.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class JudgeNavigation extends ConsumerWidget {
  const JudgeNavigation({
    super.key,
    required this.inspection,
    required this.results,
    required this.selected,
    required this.onSelect,
  });

  final Inspection inspection;
  final List<InspectionPointResult> results;
  final InspectionPointResult selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subcategoryProvider = inspectionSubcategoriesProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      filter: ArchiveFilter.all,
    );
    final pointsProvider = scrutPointsProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      selected.subcategoryId,
      filter: ArchiveFilter.all,
    );

    final subcategories = ref.watch(subcategoryProvider);
    final points = ref.watch(pointsProvider);

    final index = results.indexWhere(
      (item) => item.scrutPointId == selected.scrutPointId,
    );
    final currentSubcategory = results
        .where((item) => item.subcategoryId == selected.subcategoryId)
        .toList();

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            subcategories.when(
              data: (items) {
                final names = {for (final item in items) item.id: item.name};
                return DropdownButtonFormField<String>(
                  key: ValueKey('subcategory-${selected.subcategoryId}'),
                  initialValue: selected.subcategoryId,
                  decoration: const InputDecoration(labelText: 'Subcategory'),
                  isExpanded: true,
                  menuMaxHeight: 500,
                  items: [
                    for (final id in inspection.selectedSubcategoryIds)
                      DropdownMenuItem(
                        value: id,
                        child: Text(
                          names[id] ?? 'Unavailable subcategory',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                  onChanged: (id) {
                    if (id == null) return;
                    onSelect(
                      results
                          .firstWhere((item) => item.subcategoryId == id)
                          .scrutPointId,
                    );
                  },
                );
              },

              loading: () => const InlineLoading(),
              error: (error, _) => InlineError(
                message: 'Could not load subcategories ($error)',
                onRetry: () => ref.invalidate(subcategoryProvider),
              ),
            ),
            const SizedBox(height: 12),

            points.when(
              data: (items) {
                final names = {for (final item in items) item.id: item.name};
                return DropdownButtonFormField<String>(
                  key: ValueKey('point-${selected.scrutPointId}'),
                  initialValue: selected.scrutPointId,
                  decoration: const InputDecoration(labelText: 'Point'),
                  isExpanded: true,
                  menuMaxHeight: 500,
                  items: [
                    for (final result in currentSubcategory)
                      DropdownMenuItem(
                        value: result.scrutPointId,
                        child: Text(
                          names[result.scrutPointId] ?? 'Unavailable point',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                  onChanged: (id) {
                    if (id != null) onSelect(id);
                  },
                );
              },

              loading: () => const InlineLoading(),
              error: (error, _) => InlineError(
                message: 'Could not load points ($error)',
                onRetry: () => ref.invalidate(pointsProvider),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: index > 0
                      ? () => onSelect(results[index - 1].scrutPointId)
                      : null,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),

                Text('${index + 1} / ${results.length}'),

                OutlinedButton.icon(
                  onPressed: index < results.length - 1
                      ? () => onSelect(results[index + 1].scrutPointId)
                      : null,
                  icon: const Icon(Icons.chevron_right),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
