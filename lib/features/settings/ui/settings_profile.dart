import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/users/state/user_providers.dart';

class SettingsProfile extends ConsumerWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final email = user.email;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Profile', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                child: switch (user.image) {
                  final String image when image.isNotEmpty => ClipOval(
                    child: Image.network(
                      image,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          const Icon(Icons.person_outline, size: 32),
                    ),
                  ),
                  _ => const Icon(Icons.person_outline, size: 32),
                },
              ),
              title: Text(user.displayName),
              subtitle: email == null || email.isEmpty ? null : Text(email),
            ),
          ),
        ],
      ),
    );
  }
}
