import 'package:flutter/material.dart';

String formatLocalDateTime(BuildContext context, DateTime value) {
  final local = value.toLocal();
  final formats = MaterialLocalizations.of(context);
  return '${formats.formatMediumDate(local)}, '
      '${formats.formatTimeOfDay(TimeOfDay.fromDateTime(local))}';
}
