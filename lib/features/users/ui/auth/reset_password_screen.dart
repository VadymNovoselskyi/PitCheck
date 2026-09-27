import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/users/ui/auth/auth_screen_layout.dart';
import 'package:pit_check/features/users/ui/auth/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      child: ResetPasswordForm(onComplete: () => context.pop()),
    );
  }
}
