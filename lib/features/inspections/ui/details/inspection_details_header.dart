import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_category_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';
import 'package:pit_check/shared/ui/time_format.dart';

class InspectionDetailsHeader extends ConsumerWidget {
  const InspectionDetailsHeader({super.key, required this.inspection});

  final Inspection inspection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetProvider = inspectionSheetByIdProvider(
      inspection.inspectionSheetId,
    );
    final categoryProvider = inspectionCategoryByIdProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
    );
    final sheet = ref.watch(sheetProvider);
    final category = ref.watch(categoryProvider);
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.primary.withValues(alpha: 0.75),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sheet.when(
              data: (value) => Text(
                value == null
                    ? 'Sheet unavailable'
                    : '${value.competitionName} | ${value.year}',
                style: theme.textTheme.titleLarge,
              ),

              loading: () => const InlineLoading(),
              error: (_, _) => InlineError(
                message: 'Could not load sheet',
                onRetry: () => ref.invalidate(sheetProvider),
              ),
            ),
            const SizedBox(height: 10),

            category.when(
              data: (value) => Text(
                value?.type.label ?? 'Category unavailable',
                style: theme.textTheme.bodyLarge,
              ),

              loading: () => const InlineLoading(),
              error: (_, _) => InlineError(
                message: 'Could not load category',
                onRetry: () => ref.invalidate(categoryProvider),
              ),
            ),

            Text(
              'Subcategories: ${inspection.selectedSubcategoryIds.length}',
              style: theme.textTheme.bodyLarge,
            ),
            const Divider(height: 20),

            Text(
              inspection.startedAt == null
                  ? 'Start time pending'
                  : 'Started: ${formatLocalDateTime(context, inspection.startedAt!)}',
            ),
          ],
        ),
      ),
    );
  }
}
