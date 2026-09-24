import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_category_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspections/models/inspection.dart';
import 'package:pit_check/features/inspections/ui/setup/inspection_setup_review.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class StartInspectionForm extends ConsumerStatefulWidget {
  const StartInspectionForm({
    super.key,
    required this.sheets,
    required this.onSubmit,
  });

  final List<InspectionSheet> sheets;
  final Future<void> Function(CreateInspectionInput input) onSubmit;

  @override
  ConsumerState<StartInspectionForm> createState() =>
      _StartInspectionFormState();
}

class _StartInspectionFormState extends ConsumerState<StartInspectionForm> {
  String? _sheetId;
  String? _categoryId;

  final Set<String> _excludedSubcategoryIds = {};

  @override
  Widget build(BuildContext context) {
    final sheet = widget.sheets
        .where((item) => item.id == _sheetId)
        .firstOrNull;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Inspection scope', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          key: ValueKey(sheet?.id),
          initialValue: sheet?.id,
          decoration: const InputDecoration(labelText: 'Inspection sheet'),
          items: [
            for (final item in widget.sheets)
              DropdownMenuItem(
                value: item.id,
                child: Text('${item.competitionName} ${item.year}'),
              ),
          ],
          onChanged: (value) {
            setState(() {
              _sheetId = value;
              _categoryId = null;
              _excludedSubcategoryIds.clear();
            });
          },
        ),
        const SizedBox(height: 16),

        if (sheet == null)
          const InlineEmpty(message: 'Select an inspection sheet to continue')
        else
          _buildCategories(sheet),
      ],
    );
  }

  Widget _buildCategories(InspectionSheet sheet) {
    final provider = inspectionCategoriesProvider(sheet.id);
    final categories = ref.watch(provider);

    return categories.when(
      data: (items) {
        if (items.isEmpty) {
          return const InlineEmpty(
            message: 'This sheet has no active categories',
          );
        }

        final category = items
            .where((item) => item.id == _categoryId)
            .firstOrNull;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              key: ValueKey(sheet.id),
              initialValue: category?.id,
              decoration: const InputDecoration(labelText: 'Category'),
              items: [
                for (final item in items)
                  DropdownMenuItem(
                    value: item.id,
                    child: Text(item.type.label),
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  _categoryId = value;
                  _excludedSubcategoryIds.clear();
                });
              },
            ),

            const SizedBox(height: 24),
            if (category == null)
              const InlineEmpty(message: 'Select a category to continue')
            else
              _buildSubcategories(sheet, category),
          ],
        );
      },

      loading: () => const InlineLoading(),

      error: (error, _) => InlineError(
        message: 'Could not load categories ($error)',
        onRetry: () => ref.invalidate(provider),
      ),
    );
  }

  Widget _buildSubcategories(
    InspectionSheet sheet,
    InspectionCategory category,
  ) {
    final provider = inspectionSubcategoriesProvider(sheet.id, category.id);
    final subcategories = ref.watch(provider);

    return subcategories.when(
      data: (items) {
        if (items.isEmpty) {
          return const InlineEmpty(
            message: 'This category has no active subcategories',
          );
        }

        final included = items
            .where((item) => !_excludedSubcategoryIds.contains(item.id))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Subcategories',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextButton(
                  onPressed: _excludedSubcategoryIds.isEmpty
                      ? null
                      : () => setState(_excludedSubcategoryIds.clear),
                  child: const Text('Select all'),
                ),
              ],
            ),
            for (final item in items)
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: item.description.isEmpty
                    ? null
                    : Text(item.description),
                value: !_excludedSubcategoryIds.contains(item.id),
                onChanged: (checked) =>
                    _toggleSubcategory(item, checked ?? false),
              ),
            if (included.isEmpty)
              const InlineEmpty(message: 'Select at least one subcategory')
            else ...[
              const SizedBox(height: 16),
              InspectionSetupReview(
                sheet: sheet,
                category: category,
                includedSubcategories: included,
                onCreate: () => widget.onSubmit(
                  CreateInspectionInput(
                    inspectionSheetId: sheet.id,
                    categoryId: category.id,
                    selectedSubcategoryIds: included
                        .map((item) => item.id)
                        .toList(),
                  ),
                ),
              ),
            ],
          ],
        );
      },

      loading: () => const InlineLoading(),

      error: (error, _) => InlineError(
        message: 'Could not load subcategories ($error)',
        onRetry: () => ref.invalidate(provider),
      ),
    );
  }

  void _toggleSubcategory(InspectionSubcategory subcategory, bool selected) {
    setState(() {
      if (selected) {
        _excludedSubcategoryIds.remove(subcategory.id);
      } else {
        _excludedSubcategoryIds.add(subcategory.id);
      }
    });
  }
}
