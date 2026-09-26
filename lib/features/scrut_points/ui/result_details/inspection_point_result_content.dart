import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/inspection_point_event_providers.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_decision_history.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_current_decision.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_point_header.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionPointResultContent extends ConsumerWidget {
  const InspectionPointResultContent({super.key, required this.result});

  final InspectionPointResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inspectionProvider = inspectionByIdProvider(result.inspectionId);
    final eventsProvider = inspectionPointEventsProvider(
      result.inspectionId,
      result.scrutPointId,
    );

    final inspection = ref.watch(inspectionProvider);
    final events = ref.watch(eventsProvider);

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            inspection.when(
              data: (value) {
                if (value == null) {
                  return const InlineEmpty(message: 'Inspection unavailable');
                }

                return InspectionPointResultPointHeader(
                  inspection: value,
                  result: result,
                );
              },

              loading: () => const InlineLoading(),
              error: (error, _) => InlineError(
                message: 'Could not load inspection context ($error)',
                onRetry: () => ref.invalidate(inspectionProvider),
              ),
            ),
            const SizedBox(height: 20),

            InspectionPointResultCurrentDecision(result: result),
            const SizedBox(height: 24),

            InspectionDecisionHistory(
              events: events,
              onRetry: () => ref.invalidate(eventsProvider),
            ),
          ],
        ),
      ),
    );
  }
}
