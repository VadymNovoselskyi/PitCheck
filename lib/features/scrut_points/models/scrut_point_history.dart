import 'package:pit_check/features/scrut_points/models/inspection_point_result.dart';
import 'package:pit_check/features/scrut_points/models/inspection_point_status.dart';

class ScrutPointHistory {
  ScrutPointHistory({
    required List<InspectionPointResult> results,
    required this.passed,
    required this.failed,
    required this.skipped,
    required this.notApplicable,
    required this.pending,
  }) : results = List.unmodifiable(results);

  final List<InspectionPointResult> results;
  final int passed;
  final int failed;
  final int skipped;
  final int notApplicable;
  final int pending;

  int get inspectionCount => results.length;
  int get attemptedCount => results.length - pending;

  double? get passRate {
    final passFailDecisions = passed + failed;
    if (passFailDecisions == 0) return null;
    return passed / passFailDecisions;
  }

  factory ScrutPointHistory.fromResults(List<InspectionPointResult> results) {
    var passed = 0;
    var failed = 0;
    var skipped = 0;
    var notApplicable = 0;
    var pending = 0;

    for (final result in results) {
      switch (result.currentStatus) {
        case InspectionPointStatus.passed:
          passed++;
        case InspectionPointStatus.failed:
          failed++;
        case InspectionPointStatus.skipped:
          skipped++;
        case InspectionPointStatus.notApplicable:
          notApplicable++;
        case InspectionPointStatus.pending:
          pending++;
      }
    }

    return ScrutPointHistory(
      results: results,
      passed: passed,
      failed: failed,
      skipped: skipped,
      notApplicable: notApplicable,
      pending: pending,
    );
  }
}
