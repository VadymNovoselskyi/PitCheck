import 'package:flutter/material.dart';

import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';
import 'package:pit_check/features/scrut_points/ui/components/inspection_point_status_presentation.dart';

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
    final color = status.color(context);

    return Chip(
      avatar: Icon(status.icon, size: 18, color: color),
      label: Text(count == null ? status.label : '${status.label} $count'),
      side: BorderSide(color: color.withValues(alpha: 0.5)),
      backgroundColor: color.withValues(alpha: 0.12),
    );
  }
}
