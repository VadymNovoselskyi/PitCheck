import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_category_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionLobbyScope extends ConsumerStatefulWidget {
  const InspectionLobbyScope({super.key, required this.inspection});

  final Inspection inspection;

  @override
  ConsumerState<InspectionLobbyScope> createState() =>
      _InspectionLobbyScopeState();
}

class _InspectionLobbyScopeState extends ConsumerState<InspectionLobbyScope> {
  bool _subcategoriesExpanded = false;

  @override
  Widget build(BuildContext context) {
    final inspection = widget.inspection;
    final sheet = ref.watch(
      inspectionSheetByIdProvider(inspection.inspectionSheetId),
    );
    final category = ref.watch(
      inspectionCategoryByIdProvider(
        inspection.inspectionSheetId,
        inspection.categoryId,
      ),
    );
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Scope', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),

            _AsyncScopeValue<InspectionSheet>(
              label: 'Sheet',
              value: sheet,
              format: (value) => '${value.competitionName} ${value.year}',
              onRetry: () => ref.invalidate(
                inspectionSheetByIdProvider(inspection.inspectionSheetId),
              ),
            ),
            _AsyncScopeValue<InspectionCategory>(
              label: 'Category',
              value: category,
              format: (value) => value.type.label,
              onRetry: () => ref.invalidate(
                inspectionCategoryByIdProvider(
                  inspection.inspectionSheetId,
                  inspection.categoryId,
                ),
              ),
            ),
            const SizedBox(height: 14),

            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              shape: const Border(),
              collapsedShape: const Border(),
              title: Text(
                'Subcategories (${inspection.selectedSubcategoryIds.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onExpansionChanged: (expanded) =>
                  setState(() => _subcategoriesExpanded = expanded),
              children: _subcategoriesExpanded
                  ? [_buildSubcategories(inspection)]
                  : const [],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubcategories(Inspection inspection) {
    final provider = inspectionSubcategoriesProvider(
      inspection.inspectionSheetId,
      inspection.categoryId,
    );
    final subcategories = ref.watch(provider);

    return subcategories.when(
      data: (items) {
        final included = items
            .where(
              (item) => inspection.selectedSubcategoryIds.contains(item.id),
            )
            .toList();

        if (included.isEmpty) {
          return const InlineEmpty(
            message: 'No active subcategories are included',
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final item in included)
                Chip(
                  label: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        );
      },
      loading: () => const InlineLoading(),
      error: (error, _) => InlineError(
        message: 'Could not load subcategories ($error)',
        onRetry: () => ref.invalidate(provider),
      ),
    );
  }
}

class _AsyncScopeValue<T> extends StatelessWidget {
  const _AsyncScopeValue({
    required this.label,
    required this.value,
    required this.format,
    required this.onRetry,
  });

  final String label;
  final AsyncValue<T?> value;
  final String Function(T value) format;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (item) => _ScopeRow(
        label: label,
        value: item == null ? 'Unavailable' : format(item),
      ),

      loading: () => _ScopeRow(label: label, value: 'Loading…'),

      error: (_, _) => Row(
        children: [
          Expanded(
            child: _ScopeRow(label: label, value: 'Could not load'),
          ),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _ScopeRow extends StatelessWidget {
  const _ScopeRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
