import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(title: 'PitCheck', theme: appTheme, home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PitCheck')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("A test text"),
              FilledButton(
                onPressed: () {
                  print("The button is working");
                },
                child: const Text("Click to me to print smth!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
