import 'package:flutter/material.dart';

import 'package:pit_check/features/settings/ui/appearance_picker.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const AppearancePicker(),
    );
  }
}
