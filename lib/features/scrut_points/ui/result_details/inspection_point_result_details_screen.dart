import 'package:flutter/material.dart';

const inspectionPointResultRouteName = 'inspection-point-result-details';

class InspectionPointResultDetailsScreen extends StatelessWidget {
  const InspectionPointResultDetailsScreen({
    super.key,
    required this.inspectionId,
    required this.pointId,
  });

  final String inspectionId;
  final String pointId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inspection result details')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Selected inspection result\n\n'
            'Inspection: $inspectionId\n'
            'Point: $pointId',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
