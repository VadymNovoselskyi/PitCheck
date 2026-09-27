import 'package:flutter/material.dart';

import 'package:pit_check/features/users/state/user_providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('PitCheck', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),

            FilledButton(
              onPressed: _signIn,
              child: const Text('Continue with Google'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    try {
      await authRepository.signInWithGoogle();
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google sign-in failed: $error')),
        );
      }
    }
  }
}
