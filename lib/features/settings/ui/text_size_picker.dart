import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/settings/state/text_size_provider.dart';
import 'package:pit_check/shared/app_analytics.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class TextSizePicker extends ConsumerWidget {
  const TextSizePicker({super.key});

  static const _options = [
    (TextSize.small, 'Small', '10% smaller text'),
    (TextSize.normal, 'Default', 'Use your device text size'),
    (TextSize.large, 'Large', '15% larger text'),
    (TextSize.larger, 'Larger', '30% larger text'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSize = ref.watch(textSizeControllerProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Text size', style: theme.textTheme.titleLarge),
          const SizedBox(height: 12),

          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  for (final (size, title, subtitle) in _options)
                    Semantics(
                      selected: selectedSize == size,
                      child: ListTile(
                        title: Text(title),
                        subtitle: Text(subtitle),
                        trailing: selectedSize == size
                            ? const Icon(Icons.check)
                            : null,
                        selected: selectedSize == size,
                        onTap: () => _setSize(context, ref, size),
                      ),
                    ),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setSize(
    BuildContext context,
    WidgetRef ref,
    TextSize size,
  ) async {
    if (ref.read(textSizeControllerProvider) == size) return;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(textSizeControllerProvider.notifier).setSize(size);
      AppAnalytics.log('text_size_changed', parameters: {'size': size.name});
    } catch (_) {
      showAppSnackBar(messenger, 'Could not save text size setting');
    }
  }
}
