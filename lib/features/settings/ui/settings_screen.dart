import 'package:flutter/material.dart';

import 'package:pit_check/features/settings/ui/appearance_picker.dart';
import 'package:pit_check/features/settings/ui/settings_profile.dart';
import 'package:pit_check/features/users/state/user_providers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 96),
        children: [const SettingsProfile(), const AppearancePicker()],
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        onPressed: () => authRepository.signOut(),
        icon: const Icon(Icons.logout),
        label: const Text('Sign out'),
      ),
    );
  }
}
