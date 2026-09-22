import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_category_providers.dart';
import 'package:pit_check/features/inspection_sheets/ui/details/inspection_category_card.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionCategoriesSection extends ConsumerWidget {
  const InspectionCategoriesSection({super.key, required this.sheetId});

  final String sheetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(inspectionCategoriesProvider(sheetId));

    return categories.when(
      data: (items) {
        if (items.isEmpty) {
          return const InlineEmpty(
            message: 'No active categories in this inspection sheet.',
          );
        }

        return Column(
          children: [
            for (final category in items) ...[
              InspectionCategoryCard(sheetId: sheetId, category: category),
              const SizedBox(height: 8),
            ],
          ],
        );
      },

      loading: () => const InlineLoading(),

      error: (error, _) => InlineError(
        message: 'Could not load categories ($error)',
        onRetry: () => ref.invalidate(inspectionCategoriesProvider(sheetId)),
      ),
    );
  }
}
