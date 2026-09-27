import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Create account', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),

          TextFormField(
            decoration: const InputDecoration(labelText: 'Full name'),
            textCapitalization: TextCapitalization.words,
            autofillHints: const [AutofillHints.name],
            textInputAction: TextInputAction.next,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Enter your full name'
                : null,
            onSaved: (value) => _fullName = value!.trim(),
          ),
          const SizedBox(height: 16),

          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            autocorrect: false,
            textInputAction: TextInputAction.next,
            validator: (value) {
              final email = value?.trim() ?? '';
              if (email.isEmpty || !email.contains('@')) {
                return 'Enter a valid email address';
              }
              return null;
            },
            onSaved: (value) => _email = value!.trim(),
          ),
          const SizedBox(height: 16),

          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.newPassword],
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter your password';
              if (value.length < 6) return 'Use at least 6 characters';
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 20),

          FilledButton(onPressed: _signUp, child: const Text('Create account')),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    final form = _formKey.currentState!;
    if (!form.validate()) return;
    form.save();

    final messenger = ScaffoldMessenger.of(context);
    try {
      await authRepository.signUpWithEmail(
        fullName: _fullName,
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (error) {
      showAppSnackBar(messenger, error.code);
    } catch (_) {
      showAppSnackBar(messenger, 'Something went wrong. Please try again.');
    }
  }
}
