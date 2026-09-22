import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_subcategory.dart';
import 'package:pit_check/features/scrut_points/state/scrut_point_providers.dart';
import 'package:pit_check/shared/ui/components/inline_async_states.dart';

class InspectionSubcategoryTile extends ConsumerStatefulWidget {
  const InspectionSubcategoryTile({
    super.key,
    required this.sheetId,
    required this.categoryId,
    required this.subcategory,
  });

  final String sheetId;
  final String categoryId;
  final InspectionSubcategory subcategory;

  @override
  ConsumerState<InspectionSubcategoryTile> createState() =>
      _InspectionSubcategoryTileState();
}

class _InspectionSubcategoryTileState
    extends ConsumerState<InspectionSubcategoryTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final subcategory = widget.subcategory;

    return ExpansionTile(
      key: PageStorageKey<String>(
        'inspection-subcategory-${widget.sheetId}-${widget.categoryId}-${subcategory.id}',
      ),
      initiallyExpanded: _isExpanded,
      onExpansionChanged: (expanded) {
        if (expanded != _isExpanded) {
          setState(() => _isExpanded = expanded);
        }
      },
      title: Text(
        subcategory.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: subcategory.description.isNotEmpty
          ? Text(subcategory.description)
          : null,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      collapsedShape: const Border(),
      children: _isExpanded ? [_buildPoints()] : const [],
    );
  }

  Widget _buildPoints() {
    final points = ref.watch(
      scrutPointsProvider(
        widget.sheetId,
        widget.categoryId,
        widget.subcategory.id,
      ),
    );

    return Column(
      children: [
        const Divider(height: 1),
        points.when(
          data: (items) {
            if (items.isEmpty) {
              return const InlineEmpty(
                message: 'No active scrut points in this subcategory.',
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var index = 0; index < items.length; index++) ...[
                  InkWell(
                    onTap: () => context.go(
                      '/sheets/${widget.sheetId}/categories/${widget.categoryId}/subcategories/'
                      '${widget.subcategory.id}/points/${items[index].id}',
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].name,
                            // Slightly muteted scrut point title to easier distinguish from the subcategory title
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color
                                      ?.withValues(alpha: 0.9),
                                ),
                          ),
                          if (items[index].description.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              items[index].description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  if (index < items.length - 1)
                    const Divider(height: 1, indent: 24, endIndent: 16),
                ],
              ],
            );
          },

          loading: () => const InlineLoading(),

          error: (error, _) => InlineError(
            message: 'Could not load scrut points ($error)',
            onRetry: () => ref.invalidate(
              scrutPointsProvider(
                widget.sheetId,
                widget.categoryId,
                widget.subcategory.id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
