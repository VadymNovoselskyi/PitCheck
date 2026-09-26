import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_breadcrumb.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionPointResultPointHeader extends ConsumerWidget {
  const InspectionPointResultPointHeader({
    super.key,
    required this.inspection,
    required this.result,
  });

  final Inspection inspection;
  final InspectionPointResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointProvider = scrutPointByIdProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      result.subcategoryId,
      result.scrutPointId,
    );

    final point = ref.watch(pointProvider);
    ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrutPointBreadcrumb(
          sheetId: inspection.inspectionSheetId,
          categoryId: inspection.categoryId,
          subcategoryId: result.subcategoryId,
        ),
        const SizedBox(height: 12),

        point.when(
          data: (value) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value?.name ?? 'Unavailable point',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              if (value != null && value.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(value.description),
              ],
            ],
          ),

          loading: () => const InlineLoading(),
          error: (error, _) => InlineError(
            message: 'Could not load scrut point ($error)',
            onRetry: () => ref.invalidate(pointProvider),
          ),
        ),
      ],
    );
  }
}
