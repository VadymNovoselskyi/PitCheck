import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_result_row.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/shared/archive_filter.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionDetailsPoints extends ConsumerWidget {
  const InspectionDetailsPoints({
    super.key,
    required this.inspection,
    required this.subcategoryId,
    required this.results,
  });

  final Inspection inspection;
  final String subcategoryId;
  final List<InspectionPointResult> results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (results.isEmpty) {
      return const InlineEmpty(message: 'No results in this subcategory');
    }

    final pointsProvider = scrutPointsProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      subcategoryId,
      filter: ArchiveFilter.all,
    );
    final points = ref.watch(pointsProvider);

    return points.when(
      data: (items) {
        final pointById = {for (final item in items) item.id: item};

        return Column(
          children: [
            for (var index = 0; index < results.length; index++) ...[
              InspectionDetailsResultRow(
                result: results[index],
                point: pointById[results[index].scrutPointId],
              ),
              if (index < results.length - 1)
                const Divider(height: 1, indent: 16, endIndent: 16),
            ],
          ],
        );
      },

      loading: () => const InlineLoading(),

      error: (error, _) => InlineError(
        message: 'Could not load scrut points ($error)',
        onRetry: () => ref.invalidate(pointsProvider),
      ),
    );
  }
}
