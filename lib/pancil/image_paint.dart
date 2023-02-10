import 'package:flutter/material.dart';
import 'package:image_painter/image_painter.dart';
import 'package:testing/model/controller.dart';
import 'dart:ui' as ui;

class PaintImageDemo extends StatefulWidget {
  const PaintImageDemo({super.key});

  @override
  State<PaintImageDemo> createState() => PaintImageDemoState();
}

class PaintImageDemoState extends State<PaintImageDemo> {
  Controller _controller = Controller();
  TransformationController? _transformationController;
  ui.Image? _image;
  PaintMode? initialPaintMode;

  //the initial stroke width
  double? initialStrokeWidth;

  //the initial color
  Color? initialColor;

  Size get imageSize =>
      Size(_image?.width.toDouble() ?? 0, _image?.height.toDouble() ?? 0);

  void _scaleStartGesture(ScaleStartDetails onUpdate) {
    try {
      final zoomAdjustedOffset =
          _transformationController?.toScene(onUpdate.localFocalPoint);
      if (_controller.start == null) {
        _controller.setStart(zoomAdjustedOffset);
      }
      // _controller.setEnd(zoomAdjustedOffset);
      _controller.addOffsets(zoomAdjustedOffset);
    } catch (e) {
      debugPrint('==> ERROR : ${e.toString()}');
    }
  }

  void _scaleUpdateGesture(ScaleUpdateDetails onUpdate) {
    try {
      final zoomAdjustedOffset =
          _transformationController?.toScene(onUpdate.localFocalPoint);
      if (_controller.start == null) {
        _controller.setStart(zoomAdjustedOffset);
      }
      _controller.setEnd(zoomAdjustedOffset);
      _controller.addOffsets(zoomAdjustedOffset);
    } catch (e) {
      debugPrint('===> ERROR : ${e.toString()}');
    }
  }

  ///Fires when user stops interacting with the screen.
  void _scaleEndGesture(ScaleEndDetails onEnd) {
    try {
      _controller.setInProgress(false);
      if (_controller.start != null && _controller.end != null) {
        _controller.addOffsets(null);
        _controller.offsets.clear();
      }
      _controller.resetStartAndEnd();
    } catch (e) {
      debugPrint('===> ERROR : ${e.toString()}');
    }
  }


  @override
  void initState() {
    _controller = Controller();
    _controller.update(
      strokeWidth: initialStrokeWidth,
      color: initialColor,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller = Controller();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            width: 500,
            color: Colors.amber,
            child: FittedBox(
              alignment: FractionalOffset.center,
              child: ClipRect(
                child: InteractiveViewer(
                  transformationController: _transformationController,
                  maxScale: 2.4,
                  minScale: 1,
                  onInteractionStart: _scaleStartGesture,
                  onInteractionUpdate: _scaleUpdateGesture,
                  onInteractionEnd: _scaleEndGesture,
                  child: CustomPaint(
                    size: imageSize,
                    isComplex: false,
                    painter: DrawingPainter(controller: _controller),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter({required this.controller}) : super(repaint: controller) {
    controller = controller;
  }
  late Controller controller;
  List<Offset?>? offsetPoints = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (var item in controller.paintHistory) {
      final offset = item.offset;
      final painter = item.paint;

      for (var i = 0; i < offset!.length - 1; i++) {
        if (offset[i] != null && offset[i + 1] != null) {
          final path = Path()
            ..moveTo(offset[i]!.dx, offset[i]!.dy)
            ..lineTo(offset[i + 1]!.dx, offset[i + 1]!.dy);
          canvas.drawPath(path, painter!..strokeCap = StrokeCap.round);
        }
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}

// class DrawingPoints {
//   Paint? paint;
//   List<Offset?>? points;
//   DrawingPoints({this.points, this.paint});
// }

class PaintInfo {
  ///Used to save specific paint utils used for the specific shape.
  Paint? paint;

  ///Used to save offsets.
  ///Two point in case of other shapes and list of points for [FreeStyle].
  List<Offset?>? offset;

  ///In case of string, it is used to save string value entered.
  PaintInfo({
    this.offset,
    this.paint,
  });
}
