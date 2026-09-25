import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';

extension InspectionPointStatusPresentation on InspectionPointStatus {
  String get label => switch (this) {
    InspectionPointStatus.pending => 'Pending',
    InspectionPointStatus.skipped => 'Skipped',
    InspectionPointStatus.notApplicable => 'Not Applicable',
    InspectionPointStatus.passed => 'Passed',
    InspectionPointStatus.failed => 'Failed',
  };

  IconData get icon => switch (this) {
    InspectionPointStatus.pending => Icons.schedule_outlined,
    InspectionPointStatus.skipped => Icons.skip_next_outlined,
    InspectionPointStatus.notApplicable => Icons.not_interested_outlined,
    InspectionPointStatus.passed => Icons.check_circle_outline,
    InspectionPointStatus.failed => Icons.cancel_outlined,
  };

  Color color(BuildContext context) => switch (this) {
    InspectionPointStatus.pending => Theme.of(
      context,
    ).colorScheme.onSurfaceVariant,
    InspectionPointStatus.skipped => Colors.orange,
    InspectionPointStatus.notApplicable => Colors.blueGrey,
    InspectionPointStatus.passed => Colors.green,
    InspectionPointStatus.failed => Theme.of(context).colorScheme.error,
  };

  Color tintedSurface(BuildContext context, Color baseColor) {
    if (this == InspectionPointStatus.pending) return baseColor;

    return Color.alphaBlend(color(context).withValues(alpha: 0.16), baseColor);
  }
}
