import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/scrut_point.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_presentation.dart';
import 'package:pit_check/features/scrut_points/ui/result_details/inspection_point_result_details_screen.dart';

class InspectionDetailsResultRow extends StatelessWidget {
  const InspectionDetailsResultRow({
    super.key,
    required this.result,
    this.point,
  });

  final InspectionPointResult result;
  final ScrutPoint? point;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = result.currentStatus;
    final description = point?.description;

    return Ink(
      color: status.tintedSurface(
        context,
        theme.cardTheme.color ?? theme.colorScheme.surfaceContainerLow,
      ),
      child: InkWell(
        onTap: () => context.pushNamed(
          inspectionPointResultRouteName,
          pathParameters: {
            'inspectionId': result.inspectionId,
            'pointId': result.scrutPointId,
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Tooltip(
                message: status.label,
                child: Icon(status.icon, color: status.color(context)),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point?.name ?? 'Unavailable point',
                      style: theme.textTheme.titleMedium,
                    ),
                    if (description != null && description.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(description, style: theme.textTheme.bodySmall),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
