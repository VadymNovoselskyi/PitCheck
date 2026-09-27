import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Reset password', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),

          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            autocorrect: false,
            textInputAction: TextInputAction.done,
            validator: (value) {
              final email = value?.trim() ?? '';
              if (email.isEmpty || !email.contains('@')) {
                return 'Enter a valid email address';
              }
              return null;
            },
            onSaved: (value) => _email = value!.trim(),
          ),
          const SizedBox(height: 20),

          FilledButton(
            onPressed: _sendResetEmail,
            child: const Text('Send reset email'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendResetEmail() async {
    final form = _formKey.currentState!;
    if (!form.validate()) return;
    form.save();

    final messenger = ScaffoldMessenger.of(context);
    try {
      await authRepository.sendPasswordResetEmail(_email);
      showAppSnackBar(
        messenger,
        'If an account exists, check your email for a reset link',
      );
      if (mounted) widget.onComplete();
    } on FirebaseAuthException catch (error) {
      showAppSnackBar(messenger, error.code);
    } catch (_) {
      showAppSnackBar(messenger, 'Something went wrong. Please try again');
    }
  }
}
