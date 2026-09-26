import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/scrut_points/state/inspection_point_result_providers.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_content.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

const inspectionPointResultRouteName = 'inspection-point-result-details';

class InspectionPointResultDetailsScreen extends ConsumerWidget {
  const InspectionPointResultDetailsScreen({
    super.key,
    required this.inspectionId,
    required this.pointId,
  });

  final String inspectionId;
  final String pointId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultProvider = inspectionPointResultByPointIdProvider(
      inspectionId,
      pointId,
    );
    final result = ref.watch(resultProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inspection result details')),
      body: result.when(
        data: (value) {
          if (value == null) {
            return const EmptyView(
              icon: Icons.fact_check_outlined,
              title: 'Result not found',
              message: 'This inspection result may have been removed',
            );
          }

          return InspectionPointResultContent(result: value);
        },

        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorView(
          message: 'Could not load the inspection result ($error)',
          onRetry: () => ref.invalidate(resultProvider),
        ),
      ),
    );
  }
}
