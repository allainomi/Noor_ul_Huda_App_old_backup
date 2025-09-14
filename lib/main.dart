import 'package:flutter/material.dart';

void main() {
  runApp(const NoorApp());
}

class NoorApp extends StatelessWidget {
  const NoorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Noor-ul-Huda App')),
        body: const Center(child: Text('Welcome to Noor-ul-Huda Islamic App')),
      ),
    );
  }
}