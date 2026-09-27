import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pit_check/features/users/state/user_providers.dart';
import 'package:pit_check/shared/ui/snack_bar_helpers.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.onSignUp,
    required this.onResetPassword,
  });

  final VoidCallback onSignUp;
  final VoidCallback onResetPassword;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
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
          Text('Sign in', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),

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
            autofillHints: const [AutofillHints.password],
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter your password' : null,
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 20),

          FilledButton(onPressed: _signIn, child: const Text('Sign in')),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.onResetPassword,
              child: const Text('Forgot password?'),
            ),
          ),
          const SizedBox(height: 20),

          OutlinedButton(
            onPressed: _signInWithGoogle,
            child: const Text('Continue with Google'),
          ),
          TextButton(
            onPressed: widget.onSignUp,
            child: const Text('Create an account'),
          ),
        ],
      ),
    );
  }

  Future<void> _signIn() async {
    final form = _formKey.currentState!;
    if (!form.validate()) return;
    form.save();

    final messenger = ScaffoldMessenger.of(context);
    try {
      await authRepository.signInWithEmail(_email, _password);
    } on FirebaseAuthException catch (error) {
      showAppSnackBar(messenger, error.code);
    } catch (_) {
      showAppSnackBar(messenger, 'Something went wrong. Please try again.');
    }
  }

  Future<void> _signInWithGoogle() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await authRepository.signInWithGoogle();
    } on FirebaseAuthException catch (error) {
      showAppSnackBar(messenger, error.code);
    } catch (_) {
      showAppSnackBar(messenger, 'Google sign-in failed. Please try again.');
    }
  }
}
