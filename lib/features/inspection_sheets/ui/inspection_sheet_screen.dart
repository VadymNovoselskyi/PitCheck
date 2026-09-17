import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InspectionSheetScreen extends ConsumerStatefulWidget {
  const new({super.key, required this.id});

  final String id;

  @override
  ConsumerState<InspectionSheetScreen> createState() =>
      _InspectionSheetScreenState();
}

class _InspectionSheetScreenState extends ConsumerState<InspectionSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inspection Sheet Details')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Here you will be able to see the details of the inspection sheet ID: ${widget.id}",
              ),
              const SizedBox(height: 20),
              const Text("Here you will be able to edit an inspection sheet"),
              const SizedBox(height: 20),
              const Text(
                "Here you will be able to create a new inspection sheet",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text("Go back to home page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
