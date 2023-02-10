import 'package:flutter/material.dart';

class CustomPainting extends StatefulWidget {
  const CustomPainting({super.key});

  @override
  State<CustomPainting> createState() => _CustomPaintingState();
}

class _CustomPaintingState extends State<CustomPainting> {
  // List<List<DrawingPoints>> controller = [];
  List<DrawingPoints?> pointList = [];
  double strokeWidth = 1;

  @override
  Widget build(BuildContext context) {
    debugPrint(pointList.length.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 800,
                  width: 800,
                  color: Colors.amber,
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        pointList.add(DrawingPoints(
                            points: details.localPosition,
                            paint: Paint()
                              ..isAntiAlias = true
                              ..strokeCap = StrokeCap.round
                              ..strokeWidth = strokeWidth));
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        pointList.add(DrawingPoints(
                            points: details.localPosition,
                            paint: Paint()
                              ..isAntiAlias = true
                              ..strokeCap = StrokeCap.round
                              ..strokeWidth = strokeWidth));
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        // controller.add(pointList);
                        pointList.add(null);
                        // debugPrint(
                        //     '===> data : ${controller.length.toString()}');
                      });
                    },
                    child: CustomPaint(
                        isComplex: true,
                        size: Size.zero,
                        willChange: true,
                        painter: DrawingPainter(pointsList: pointList)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter({this.pointsList});
  List<DrawingPoints?>? pointsList;
  List<Offset> offsetPoints = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < (pointsList!.length); i++) {
      // ignore: unnecessary_null_comparison
      if (pointsList?[i] != null && pointsList?[i + 1] != null) {
        canvas.drawLine(
            pointsList?[i]?.points ?? const Offset(100, 100),
            pointsList?[i + 1]?.points ?? const Offset(100, 100),
            pointsList?[i]?.paint ?? Paint());
      } else if (pointsList?[i] != null && pointsList?[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList?[i]?.points ?? const Offset(0, 0));

        canvas.drawLine(
          pointsList?[i]?.points ?? const Offset(0, 0),
          pointsList?[i + 1]?.points ??
              Offset(
                  pointsList!.last!.points!.dx, pointsList!.last!.points!.dy),
          pointsList?[i]?.paint ?? Paint(),
        );
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
  
}

class DrawingPoints {
  Paint? paint;
  Offset? points;
  DrawingPoints({this.points, this.paint});
}
