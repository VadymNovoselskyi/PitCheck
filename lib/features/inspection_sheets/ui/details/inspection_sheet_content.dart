import 'package:flutter/material.dart';

import 'package:pit_check/features/inspection_sheets/models/inspection_sheet.dart';
import 'package:pit_check/features/inspection_sheets/ui/details/inspection_categories_section.dart';
import 'package:pit_check/features/inspection_sheets/ui/details/inspection_sheet_header.dart';

class InspectionSheetContent extends StatelessWidget {
  const InspectionSheetContent({super.key, required this.sheet});

  final InspectionSheet sheet;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      children: [
        InspectionSheetHeader(sheet: sheet),
        const SizedBox(height: 24),

        Text(
          'Inspection categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),

        InspectionCategoriesSection(sheetId: sheet.id),
      ],
    );
  }
}
