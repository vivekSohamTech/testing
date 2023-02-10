import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import 'dart:math' as math;

class TouchablePackage extends StatefulWidget {
  const TouchablePackage({super.key});

  @override
  State<TouchablePackage> createState() => _TouchablePackageState();
}

class _TouchablePackageState extends State<TouchablePackage> {
  @override
  Widget build(BuildContext context) {
    // List<Widget> contatos = List.generate(
    //   count,
    //   (int i) => CustomPaint(
    //     painter: OpenPainter(context),
    //   ),
    // );
    return Container(
        color: const Color.fromARGB(255, 170, 255, 215),
        child: CanvasTouchDetector(
          builder: (context) => CustomPaint(
            painter: OpenPainter(context),
          ),
        ));
  }
}

class OpenPainter extends CustomPainter {
  BuildContext context;
  OpenPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    final radius = math.min(size.width, size.height) / 8;
    const center = Offset(50, 50);
    Paint paintCircle = Paint()..color = Colors.transparent;
    Paint paintBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width / 50
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paintCircle);

    canvas.drawCircle(center, radius, paintBorder);
    myCanvas.drawCircle(const Offset(100, 100), 50, Paint(),
        onTapDown: (tapdetail) {
      debugPrint("orange Circle touched");
    }, onPanDown: (tapdetail) {
      debugPrint("orange circle swiped");
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
