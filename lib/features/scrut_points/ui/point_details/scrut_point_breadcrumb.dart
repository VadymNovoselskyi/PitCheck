import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspection_sheets/state/inspection_category_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_sheet_providers.dart';
import 'package:pit_check/features/inspection_sheets/state/inspection_subcategory_providers.dart';

class ScrutPointBreadcrumb extends ConsumerWidget {
  const ScrutPointBreadcrumb({
    super.key,
    required this.sheetId,
    required this.categoryId,
    required this.subcategoryId,
  });

  final String sheetId;
  final String categoryId;
  final String subcategoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheet = ref.watch(inspectionSheetByIdProvider(sheetId));
    final category = ref.watch(
      inspectionCategoryByIdProvider(sheetId, categoryId),
    );
    final subcategory = ref.watch(
      inspectionSubcategoryByIdProvider(sheetId, categoryId, subcategoryId),
    );
    final states = <AsyncValue<Object?>>[sheet, category, subcategory];

    if (states.any((state) => state.hasError)) {
      return InkWell(
        onTap: () => {
          ref
            ..invalidate(inspectionSheetByIdProvider(sheetId))
            ..invalidate(inspectionCategoryByIdProvider(sheetId, categoryId))
            ..invalidate(
              inspectionSubcategoryByIdProvider(
                sheetId,
                categoryId,
                subcategoryId,
              ),
            ),
        },
        child: _text(context, 'Could not load context. Tap to retry'),
      );
    }

    if (states.any((state) => state.isLoading)) {
      return _text(context, 'Loading inspection context…');
    }

    final loadedSheet = sheet.requireValue;
    final loadedCategory = category.requireValue;
    final loadedSubcategory = subcategory.requireValue;
    if (loadedSheet == null ||
        loadedCategory == null ||
        loadedSubcategory == null) {
      return _text(context, 'Inspection context unavailable');
    }
    final sheetLocation = Uri(path: '/sheets/$sheetId').toString();

    return Row(
      children: [
        Flexible(
          child: _link(
            context,
            '${loadedSheet.competitionName} ${loadedSheet.year}',
            sheetLocation,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text('/', style: Theme.of(context).textTheme.bodySmall),
        ),
        Flexible(
          child: _link(context, loadedCategory.type.label, sheetLocation),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text('/', style: Theme.of(context).textTheme.bodySmall),
        ),
        Flexible(child: _link(context, loadedSubcategory.name, sheetLocation)),
      ],
    );
  }

  Widget _text(BuildContext context, String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall
          ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
    );
  }

  Widget _link(BuildContext context, String label, String location) {
    return Semantics(
      link: true,
      child: InkWell(
        onTap: () => context.go(location),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
