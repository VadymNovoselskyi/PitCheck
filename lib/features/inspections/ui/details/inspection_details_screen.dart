import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_header.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_subcategory_card.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/inspection_point_result_providers.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionDetailsScreen extends ConsumerWidget {
  const InspectionDetailsScreen({super.key, required this.inspection});

  final Inspection inspection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsProvider = inspectionPointResultsProvider(inspection.id);
    final results = ref.watch(resultsProvider);

    return ListView(
      key: PageStorageKey<String>('inspection-details-${inspection.id}'),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 60),
      children: [
        InspectionDetailsHeader(inspection: inspection),
        const SizedBox(height: 24),

        Text('Results', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),

        results.when(
          data: (items) {
            final grouped = <String, List<InspectionPointResult>>{};
            for (final result in items) {
              grouped[result.subcategoryId] ??= [];
              grouped[result.subcategoryId]!.add(result);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (items.isEmpty)
                  const InlineEmpty(message: 'No inspection results yet'),

                for (final subcategoryId in inspection.selectedSubcategoryIds)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InspectionDetailsSubcategoryCard(
                      inspection: inspection,
                      subcategoryId: subcategoryId,
                      results: grouped[subcategoryId] ?? const [],
                    ),
                  ),
              ],
            );
          },

          loading: () => const InlineLoading(),

          error: (error, _) => InlineError(
            message: 'Could not load inspection results ($error)',
            onRetry: () => ref.invalidate(resultsProvider),
          ),
        ),
      ],
    );
  }
}
