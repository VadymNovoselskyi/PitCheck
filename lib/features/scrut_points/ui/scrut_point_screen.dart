import 'package:flutter/material.dart';

class ScrutPointScreen extends StatelessWidget {
  const ScrutPointScreen({
    super.key,
    required this.sheetId,
    required this.categoryId,
    required this.subcategoryId,
    required this.pointId,
  });

  final String sheetId;
  final String categoryId;
  final String subcategoryId;
  final String pointId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scrut point details')),
      body: Center(
        child: Text(
          'Selected scrut point\n\n'
          'Sheet: $sheetId\n'
          'Category: $categoryId\n'
          'Subcategory: $subcategoryId\n'
          'Point: $pointId',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
