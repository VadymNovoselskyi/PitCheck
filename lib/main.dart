import 'package:flutter/material.dart';

import 'theme.dart';

void main() {
  runApp(const ScrutApp());
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
