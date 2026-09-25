import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_chip.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class JudgePointHeader extends ConsumerWidget {
  const JudgePointHeader({
    super.key,
    required this.inspection,
    required this.result,
  });

  final Inspection inspection;
  final InspectionPointResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subcategoryProvider = inspectionSubcategoryByIdProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      result.subcategoryId,
    );
    final pointProvider = scrutPointByIdProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      result.subcategoryId,
      result.scrutPointId,
    );

    final subcategory = ref.watch(subcategoryProvider);
    final point = ref.watch(pointProvider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subcategory.when(
              data: (item) => Text(item?.name ?? 'Unavailable subcategory'),

              loading: () => const InlineLoading(),
              error: (_, _) => InlineError(
                message: 'Could not load subcategory',
                onRetry: () => ref.invalidate(subcategoryProvider),
              ),
            ),
            const SizedBox(height: 8),
            point.when(
              data: (item) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.name ?? 'Unavailable point',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (item?.description.isNotEmpty == true) ...[
                    const SizedBox(height: 8),
                    Text(item!.description),
                  ],
                ],
              ),

              loading: () => const InlineLoading(),
              error: (_, _) => InlineError(
                message: 'Could not load point',
                onRetry: () => ref.invalidate(pointProvider),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: InspectionPointStatusChip(status: result.currentStatus),
            ),
          ],
        ),
      ),
    );
  }
}
