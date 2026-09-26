import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_decision_form.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_navigation.dart';
import 'package:pit_check/features/inspections/ui/judge/judge_point_header.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/state/inspection_point_event_providers.dart';
import 'package:pit_check/features/scrut_points/state/inspection_point_result_providers.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_decision_history.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class JudgeContent extends ConsumerStatefulWidget {
  const JudgeContent({
    super.key,
    required this.inspection,
    this.initialPointId,
  });

  final Inspection inspection;
  final String? initialPointId;

  @override
  ConsumerState<JudgeContent> createState() => _JudgeContentState();
}

class _JudgeContentState extends ConsumerState<JudgeContent> {
  String? _selectedPointId;

  @override
  Widget build(BuildContext context) {
    final resultsProvider = inspectionPointResultsProvider(
      widget.inspection.id,
    );
    final results = ref.watch(resultsProvider);

    return results.when(
      data: (items) {
        final ordered = <InspectionPointResult>[];
        for (final subcategoryId in widget.inspection.selectedSubcategoryIds) {
          ordered.addAll(
            items.where((item) => item.subcategoryId == subcategoryId),
          );
        }

        if (ordered.isEmpty) {
          return const Center(
            child: InlineEmpty(message: 'No results in this inspection'),
          );
        }

        final selectedIndex = ordered.indexWhere(
          (result) =>
              result.scrutPointId ==
              (_selectedPointId ?? widget.initialPointId),
        );
        final index = selectedIndex < 0 ? 0 : selectedIndex;
        final selected = ordered[index];

        final eventsProvider = inspectionPointEventsProvider(
          widget.inspection.id,
          selected.scrutPointId,
        );
        final events = ref.watch(eventsProvider);

        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              key: ValueKey('judge-point-${selected.scrutPointId}'),
              padding: const EdgeInsets.all(16),
              children: [
                JudgeNavigation(
                  inspection: widget.inspection,
                  results: ordered,
                  selected: selected,
                  onSelect: (pointId) =>
                      setState(() => _selectedPointId = pointId),
                ),
                const SizedBox(height: 20),

                JudgePointHeader(
                  inspection: widget.inspection,
                  result: selected,
                ),
                const SizedBox(height: 20),

                JudgeDecisionForm(
                  key: ValueKey((
                    selected.scrutPointId,
                    selected.currentStatus,
                    selected.currentNote,
                  )),
                  result: selected,
                ),
                const SizedBox(height: 24),

                InspectionDecisionHistory(
                  events: events,
                  onRetry: () => ref.invalidate(eventsProvider),
                ),
              ],
            ),
          ),
        );
      },

      loading: () => const Center(child: InlineLoading()),
      error: (error, _) => Center(
        child: InlineError(
          message: 'Could not load inspection results ($error)',
          onRetry: () => ref.invalidate(resultsProvider),
        ),
      ),
    );
  }
}
