import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspections/state/inspection_providers.dart';
import 'package:pit_check/features/inspections/ui/archive/inspection_archive_card.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class InspectionsArchiveScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archiveProvider = inspectionsProvider(completed: true);
    final inspections = ref.watch(archiveProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inspections Archive')),
      body: inspections.when(
        data: (items) {
          if (items.isEmpty) {
            return const EmptyView(
              icon: Icons.archive_outlined,
              title: 'No completed inspections',
              message: 'Completed inspections will appear here',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) =>
                InspectionArchiveCard(inspection: items[index]),
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorView(
          message: 'Could not load inspections ($error)',
          onRetry: () => ref.invalidate(archiveProvider),
        ),
      ),
    );
  }
}
