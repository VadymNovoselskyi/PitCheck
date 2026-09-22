import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_category.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';
import 'package:pit_check/features/inspection_sheets/ui/components/inspection_subcategory_tile.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionCategoryCard extends ConsumerStatefulWidget {
  const InspectionCategoryCard({
    super.key,
    required this.sheetId,
    required this.category,
  });

  final String sheetId;
  final InspectionCategory category;

  @override
  ConsumerState<InspectionCategoryCard> createState() =>
      _InspectionCategoryCardState();
}

class _InspectionCategoryCardState
    extends ConsumerState<InspectionCategoryCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        key: PageStorageKey<String>(
          'inspection-category-${widget.sheetId}-${widget.category.id}',
        ),
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (expanded) {
          if (expanded != _isExpanded) {
            setState(() => _isExpanded = expanded);
          }
        },
        title: Text(
          widget.category.type.label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        childrenPadding: EdgeInsets.zero,
        // We already use our own divider, so we don't want the ExpansionTile to add its own
        shape: const Border(),
        collapsedShape: const Border(),
        children: _isExpanded ? [_buildSubcategories()] : const [],
      ),
    );
  }

  Widget _buildSubcategories() {
    final subcategories = ref.watch(
      inspectionSubcategoriesProvider(widget.sheetId, widget.category.id),
    );

    return Column(
      children: [
        const Divider(height: 1),
        subcategories.when(
          data: (items) {
            if (items.isEmpty) {
              return const InlineEmpty(
                message: 'No active subcategories in this category.',
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var index = 0; index < items.length; index++) ...[
                  InspectionSubcategoryTile(
                    sheetId: widget.sheetId,
                    categoryId: widget.category.id,
                    subcategory: items[index],
                  ),
                  if (index < items.length - 1) const Divider(height: 2),
                ],
              ],
            );
          },

          loading: () => const InlineLoading(),

          error: (error, _) => InlineError(
            message: 'Could not load subcategories ($error)',
            onRetry: () => ref.invalidate(
              inspectionSubcategoriesProvider(
                widget.sheetId,
                widget.category.id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
