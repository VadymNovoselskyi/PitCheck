import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pit_check/router.dart';

import 'firebase_options.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const ScrutApp()));
}

class ScrutApp extends StatelessWidget {
  const ScrutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PitCheck',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
