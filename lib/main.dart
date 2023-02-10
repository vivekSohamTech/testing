import 'package:flutter/material.dart';
import 'package:testing/pancil/keyboard_selector.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KeyboardSelector(),
    );
  }
}
