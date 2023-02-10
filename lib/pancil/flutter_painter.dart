import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';
import 'dart:ui' as ui;

class FlutterPainterDemo extends StatefulWidget {
  const FlutterPainterDemo({super.key});

  @override
  State<FlutterPainterDemo> createState() => _FlutterPainterDemoState();
}

class _FlutterPainterDemoState extends State<FlutterPainterDemo> {
  PainterController controller = PainterController();
  static const Color red = Color.fromARGB(255, 0, 0, 0);
  FocusNode textFocusNode = FocusNode();
  ui.Image? backgroundImage;
  Paint shapePaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void initState() {
    controller = PainterController(
        settings: PainterSettings(
            text: TextSettings(
              focusNode: textFocusNode,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: red, fontSize: 18),
            ),
            freeStyle: const FreeStyleSettings(
              color: red,
              strokeWidth: 5,
            ),
            shape: ShapeSettings(
              paint: shapePaint,
            ),
            scale: const ScaleSettings(
              enabled: true,
              minScale: 1,
              maxScale: 5,
            )));
    // Listen to focus events of the text field
    textFocusNode.addListener(onFocus);
    // Initialize background
    initBackground();
    super.initState();
  }

  void initBackground() async {
    final image = await const AssetImage(
      'asset/sample.jpg',
    ).image;

    setState(() {
      backgroundImage = image;
      controller.background = image.backgroundDrawable;
    });
  }

  /// Updates UI when the focus changes
  void onFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if (backgroundImage != null)
              Positioned(
                bottom: 20,
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 255, 240, 195),
                    child: FlutterPainter(
                      controller: controller,
                    ),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      controller.canRedo ? controller.redo() : null;
                    });
                  },
                  icon: const Icon(
                    Icons.undo,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      controller.canUndo ? controller.undo() : null;
                    });
                  },
                  icon: const Icon(
                    Icons.redo,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Clear')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
