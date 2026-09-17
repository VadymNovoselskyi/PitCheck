import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PitCheck')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Here will you be able to see the ongoing inspection if there is one (and join it)",
              ),
              const SizedBox(height: 20),
              const Text(
                "Here you will be able to see a summary about the latest inspection",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/inspection-sheets/abc');
                },
                child: const Text(
                  "Go to inspection sheet details page with ID:'abc'",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
