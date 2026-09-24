import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';

class InspectionPointStatusChip extends StatelessWidget {
  const InspectionPointStatusChip({
    super.key,
    required this.status,
    this.count,
  });

  final InspectionPointStatus status;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final color = _color(context);

    return Chip(
      avatar: Icon(_icon, size: 18, color: color),
      label: Text(count == null ? _label : '$_label $count'),
      side: BorderSide(color: color.withValues(alpha: 0.5)),
      backgroundColor: color.withValues(alpha: 0.12),
    );
  }

  String get _label => switch (status) {
    InspectionPointStatus.pending => 'Pending',
    InspectionPointStatus.skipped => 'Skipped',
    InspectionPointStatus.notApplicable => 'Not Applicable',
    InspectionPointStatus.passed => 'Passed',
    InspectionPointStatus.failed => 'Failed',
  };

  IconData get _icon => switch (status) {
    InspectionPointStatus.pending => Icons.schedule_outlined,
    InspectionPointStatus.skipped => Icons.skip_next_outlined,
    InspectionPointStatus.notApplicable => Icons.not_interested_outlined,
    InspectionPointStatus.passed => Icons.check_circle_outline,
    InspectionPointStatus.failed => Icons.cancel_outlined,
  };

  Color _color(BuildContext context) => switch (status) {
    InspectionPointStatus.pending => Theme.of(
      context,
    ).colorScheme.onSurfaceVariant,
    InspectionPointStatus.skipped => Colors.orange,
    InspectionPointStatus.notApplicable => Colors.blueGrey,
    InspectionPointStatus.passed => Colors.green,
    InspectionPointStatus.failed => Theme.of(context).colorScheme.error,
  };
}
