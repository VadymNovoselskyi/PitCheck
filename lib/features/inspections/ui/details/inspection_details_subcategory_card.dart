import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/details/inspection_details_points.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';

class InspectionDetailsSubcategoryCard extends ConsumerWidget {
  const InspectionDetailsSubcategoryCard({
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
    final subcategoryProvider = inspectionSubcategoryByIdProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
      subcategoryId,
    );
    final subcategory = ref.watch(subcategoryProvider);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        key: PageStorageKey<String>(
          'inspection-${inspection.id}-subcategory-$subcategoryId',
        ),
        title: Text(
          subcategory.when(
            data: (value) => value?.name ?? 'Subcategory unavailable',
            loading: () => 'Loading subcategory…',
            error: (_, _) => 'Could not load subcategory',
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: subcategory.hasError
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => ref.invalidate(subcategoryProvider),
                  child: const Text('Retry'),
                ),
              )
            : null,
        childrenPadding: EdgeInsets.zero,
        shape: const Border(),
        collapsedShape: const Border(),
        children: [
          const Divider(height: 1),
          InspectionDetailsPoints(
            inspection: inspection,
            subcategoryId: subcategoryId,
            results: results,
          ),
        ],
      ),
    );
  }
}
