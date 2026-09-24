import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/scrut_points/ui/point_details/scrut_point_breadcrumb.dart';

class ScrutPointHeader extends StatelessWidget {
  const ScrutPointHeader({
    super.key,
    required this.sheetId,
    required this.categoryId,
    required this.subcategoryId,
    required this.point,
  });

  final String sheetId;
  final String categoryId;
  final String subcategoryId;
  final ScrutPoint point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrutPointBreadcrumb(
            sheetId: sheetId,
            categoryId: categoryId,
            subcategoryId: subcategoryId,
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  point.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              if (point.isArchived) ...[
                const SizedBox(width: 12),
                const Chip(
                  avatar: Icon(Icons.archive_outlined, size: 18),
                  label: Text('Archived'),
                ),
              ],
            ],
          ),
          if (point.description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              point.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ],
      ),
    );
  }
}
