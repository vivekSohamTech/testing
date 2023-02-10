import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/model/controller.dart';
import 'package:testing/testing.dart';

main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller(),
      child: const MaterialApp(
        home: Testing(),
      ),
    );
  }
}
