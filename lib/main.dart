import 'package:flutter/material.dart';

void main() {
  runApp(const ScrutApp());
}

class ScrutApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Scrutineering App", home: Home());
  }
}

class Home extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrutineering App!"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
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
