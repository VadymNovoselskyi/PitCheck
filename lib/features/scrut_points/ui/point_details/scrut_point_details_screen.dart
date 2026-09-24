import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/scrut_points/state/inspection_point_result_providers.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_form.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_header.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_results.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_summary.dart';
import 'package:pit_check/shared/ui/components/empty_view.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class ScrutPointDetailsScreen extends ConsumerWidget {
  const ScrutPointDetailsScreen({
    super.key,
    required this.sheetId,
    required this.categoryId,
    required this.subcategoryId,
    required this.pointId,
  });

  final String sheetId;
  final String categoryId;
  final String subcategoryId;
  final String pointId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final point = ref.watch(
      scrutPointByIdProvider(sheetId, categoryId, subcategoryId, pointId),
    );
    final loadedPoint = point.hasValue ? point.requireValue : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrut point details'),
        actions: [
          if (loadedPoint != null)
            IconButton(
              tooltip: 'Edit scrut point',
              onPressed: () => _showEditForm(context, ref, loadedPoint),
              icon: const Icon(Icons.edit_outlined),
            ),
        ],
      ),
      body: point.when(
        data: (value) => _buildLoaded(value, ref),

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => ErrorView(
          message: 'Could not load the scrut point ($error)',
          onRetry: () => ref.invalidate(
            scrutPointByIdProvider(sheetId, categoryId, subcategoryId, pointId),
          ),
        ),
      ),
    );
  }

  Widget _buildLoaded(ScrutPoint? point, WidgetRef ref) {
    if (point == null) {
      return const EmptyView(
        icon: Icons.rule_outlined,
        title: 'Scrut point not found',
        message: 'This scrut point may have been removed.',
      );
    }

    final historyProvider = scrutPointHistoryProvider(
      sheetId,
      categoryId,
      subcategoryId,
      pointId,
    );
    final history = ref.watch(historyProvider);
    void retryHistory() => ref.invalidate(historyProvider);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          ScrutPointHeader(
            sheetId: sheetId,
            categoryId: categoryId,
            subcategoryId: subcategoryId,
            point: point,
          ),
          const Divider(height: 1),
          const TabBar(
            tabs: [
              Tab(text: 'Summary'),
              Tab(text: 'Previous Results'),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              children: [
                ScrutPointSummary(history: history, onRetry: retryHistory),
                ScrutPointResults(history: history, onRetry: retryHistory),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditForm(
    BuildContext context,
    WidgetRef ref,
    ScrutPoint point,
  ) async {
    final input = await showModalBottomSheet<ScrutPointInput>(
      context: context,
      isScrollControlled: true,
      builder: (context) => ScrutPointForm(initialValue: point.toInput()),
    );

    if (input == null || !context.mounted) return;

    try {
      await ref
          .read(scrutPointActionsProvider.notifier)
          .updatePoint(sheetId, categoryId, subcategoryId, pointId, input);
      if (context.mounted) _showMessage(context, 'Changes saved');
    } catch (_) {
      if (context.mounted) {
        _showMessage(context, 'Could not save the scrut point');
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
