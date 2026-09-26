import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/settings/state/theme_mode_provider.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class AppearancePicker extends ConsumerWidget {
  const AppearancePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(themeModeControllerProvider);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Appearance', style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),

        Text(
          'Choose how PitCheck looks on this device.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Semantics(
                selected: selectedMode == ThemeMode.system,
                child: ListTile(
                  leading: const Icon(Icons.brightness_auto_outlined),
                  title: const Text('System'),
                  subtitle: const Text('Follow your device appearance'),
                  trailing: selectedMode == ThemeMode.system
                      ? const Icon(Icons.check)
                      : null,
                  selected: selectedMode == ThemeMode.system,
                  onTap: () => _setMode(context, ref, ThemeMode.system),
                ),
              ),
              const Divider(),

              Semantics(
                selected: selectedMode == ThemeMode.light,
                child: ListTile(
                  leading: const Icon(Icons.light_mode_outlined),
                  title: const Text('Light'),
                  subtitle: const Text('Use a light appearance'),
                  trailing: selectedMode == ThemeMode.light
                      ? const Icon(Icons.check)
                      : null,
                  selected: selectedMode == ThemeMode.light,
                  onTap: () => _setMode(context, ref, ThemeMode.light),
                ),
              ),
              const Divider(),

              Semantics(
                selected: selectedMode == ThemeMode.dark,
                child: ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Dark'),
                  subtitle: const Text('Use a dark appearance'),
                  trailing: selectedMode == ThemeMode.dark
                      ? const Icon(Icons.check)
                      : null,
                  selected: selectedMode == ThemeMode.dark,
                  onTap: () => _setMode(context, ref, ThemeMode.dark),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _setMode(
    BuildContext context,
    WidgetRef ref,
    ThemeMode mode,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(themeModeControllerProvider.notifier).setMode(mode);
    } catch (_) {
      showAppSnackBar(messenger, 'Could not save appearance setting');
    }
  }
}
