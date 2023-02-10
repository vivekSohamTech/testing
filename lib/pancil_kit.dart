import 'package:flutter/material.dart';

class PancilKitPackage extends StatefulWidget {
  const PancilKitPackage({super.key});

  @override
  State<PancilKitPackage> createState() => _PancilKitPackageState();
}

class _PancilKitPackageState extends State<PancilKitPackage> {
  @override
  Widget build(BuildContext context) {
    TransformationController controllerr = TransformationController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('PencilKit Example'),
          actions: const [],
        ),
        body: Center(
            child: InteractiveViewer(
                // panEnabled: false,
                transformationController: controllerr,
                scaleEnabled: false,
                boundaryMargin: const EdgeInsets.all(200),
                // minScale: 0.5,
                // maxScale: 4,
                child: ClipOval(
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: double.infinity, vertical: double.infinity),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 255, 171, 164),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                ))));
  }
}
