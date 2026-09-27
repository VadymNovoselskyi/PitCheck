import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/components/error_view.dart';

class AccountErrorScreen extends ConsumerWidget {
  const AccountErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ErrorView(
        title: 'Could not load your account',
        message: 'Try again. If this continues, restart the app or report it.',
        onRetry: () => ref.invalidate(appUserProvider),
      ),
    );
  }
}
