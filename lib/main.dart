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
        title: const Text("Hello World!"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Text("A test text"),
          FilledButton(onPressed: () {}, child: const Text("Im a button!")),
        ],
      ),
    );
  }
}
