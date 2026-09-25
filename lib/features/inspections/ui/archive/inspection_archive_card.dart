import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/inspection_screen.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';
import 'package:pit_check/shared/ui/time_format.dart';

class InspectionArchiveCard extends ConsumerWidget {
  const InspectionArchiveCard({super.key, required this.inspection});

  final Inspection inspection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetProvider = inspectionSheetByIdProvider(
      inspection.inspectionSheetId,
    );
    final sheet = ref.watch(sheetProvider);
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.pushNamed(
          inspectionRouteName,
          pathParameters: {'inspectionId': inspection.id},
        ),
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
                  style: theme.textTheme.titleMedium,
                ),

                loading: () => Text('Loading sheet…'),
                error: (_, _) => InlineError(
                  message: 'Could not load sheet',
                  onRetry: () => ref.invalidate(sheetProvider),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                inspection.startedAt == null
                    ? 'Start time pending'
                    : 'Started: ${formatLocalDateTime(context, inspection.startedAt!)}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
