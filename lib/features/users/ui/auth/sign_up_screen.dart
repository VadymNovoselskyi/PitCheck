import 'package:flutter/material.dart';

import 'package:pit_check/features/users/ui/auth/auth_screen_layout.dart';
import 'package:pit_check/features/users/ui/auth/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScreenLayout(child: SignUpForm());
  }
}
