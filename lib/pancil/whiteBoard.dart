// ignore: file_names
import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';

class WhiteBoardPackage extends StatefulWidget {
  const WhiteBoardPackage({super.key});

  @override
  State<WhiteBoardPackage> createState() => _WhiteBoardPackageState();
}

class _WhiteBoardPackageState extends State<WhiteBoardPackage> {
  @override
  Widget build(BuildContext context) {
    final imageKey = GlobalKey<ImagePainterState>();
    debugPrint(imageKey.toString());
    // final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(),
      body: ImagePainter.asset(
        "asset/sample.png",
        key: imageKey,
        scalable: true,
        undoIcon: const Icon(Icons.undo),
        controlsAtTop: false,
        initialStrokeWidth: 2,
        initialColor: Colors.green,
        initialPaintMode: PaintMode.freeStyle,
      ),
    );
  }
}
