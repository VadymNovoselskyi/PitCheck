import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/inspections/ui/setup/start_inspection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PitCheck')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Start a new scrutineering inspection and invite the rest of the team from its lobby',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => context.pushNamed(startInspectionRouteName),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start inspection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
