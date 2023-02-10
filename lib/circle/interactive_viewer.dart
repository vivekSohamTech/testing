import 'package:flutter/material.dart';
import 'dart:math' as math;

class InteractiveViewerWidgets extends StatefulWidget {
  const InteractiveViewerWidgets({super.key});

  @override
  State<InteractiveViewerWidgets> createState() =>
      _InteractiveViewerWidgetsState();
}

class _InteractiveViewerWidgetsState extends State<InteractiveViewerWidgets> {
  @override
  Widget build(BuildContext context) {
    // List<Widget> contatos = List.generate(
    //   count,
    //   (int i) => CustomPaint(
    //     painter: OpenPainter(context),
    //   ),
    // );
    return Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              color: const Color.fromARGB(255, 255, 244, 210),
              height: 500,
              width: 500,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      color: const Color.fromARGB(255, 188, 180, 255),
                      width: 200,
                      child: InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(double.infinity),
                          maxScale: 50,
                          minScale: 0.1,
                          // alignment: Alignment.bottomCenter,
                          child: CustomPaint(
                            // isComplex: true,
                            painter: OpenPainter(context),
                            child: Container(),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                      child: InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(double.infinity),
                          maxScale: 50,
                          minScale: 0.1,
                          child: CustomPaint(
                            painter: OpenPainter(context),
                            child: Container(),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  BuildContext context;
  OpenPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 8;
    const center = Offset(50, 50);
    Paint paintCircle = Paint()..color = Colors.transparent;
    Paint paintBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width / 50
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paintCircle);
    canvas.drawCircle(center, radius, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
