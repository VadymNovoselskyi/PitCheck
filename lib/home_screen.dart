import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/archive/inspection_archive_card.dart';
import 'package:pit_check/features/inspections/ui/home/home_active_inspection.dart';
import 'package:pit_check/features/inspections/ui/setup/start_inspection_screen.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(inspectionsProvider(completed: false));
    final completed = ref.watch(inspectionsProvider(completed: true));

    return Scaffold(
      appBar: AppBar(title: const Text('PitCheck')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Active inspections',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          active.when(
            data: (items) {
              if (items.isEmpty) {
                return SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () =>
                        context.pushNamed(startInspectionRouteName),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start inspection'),
                  ),
                );
              }

              return Column(
                children: [
                  for (var index = 0; index < items.length; index++) ...[
                    HomeActiveInspection(inspection: items[index]),
                    if (index < items.length - 1) const SizedBox(height: 20),
                  ],
                ],
              );
            },

            loading: () => const InlineLoading(),
            error: (error, _) => InlineError(
              message: 'Could not load active inspections ($error)',
              onRetry: () =>
                  ref.invalidate(inspectionsProvider(completed: false)),
            ),
          ),
          const SizedBox(height: 32),

          Text(
            'Latest completed',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          completed.when(
            data: (items) => items.isEmpty
                ? const InlineEmpty(message: 'No completed inspections yet')
                : InspectionArchiveCard(inspection: items.first),

            loading: () => const InlineLoading(),
            error: (error, _) => InlineError(
              message: 'Could not load completed inspections ($error)',
              onRetry: () =>
                  ref.invalidate(inspectionsProvider(completed: true)),
            ),
          ),
        ],
      ),
    );
  }
}
