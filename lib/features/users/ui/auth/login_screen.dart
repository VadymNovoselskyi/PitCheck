import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pit_check/features/users/ui/auth/auth_screen_layout.dart';
import 'package:pit_check/features/users/ui/auth/sign_in_form.dart';
import 'package:pit_check/route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.from});

  final String? from;

  @override
  Widget build(BuildContext context) {
    // Propogate further the query params
    final queryParameters = from == null ? <String, String>{} : {'from': from!};

    return AuthScreenLayout(
      child: SignInForm(
        onSignUp: () => context.pushNamed(
          RouteNames.signUp,
          queryParameters: queryParameters,
        ),
        onResetPassword: () => context.pushNamed(
          RouteNames.resetPassword,
          queryParameters: queryParameters,
        ),
      ),
    );
  }
}
