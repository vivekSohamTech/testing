import 'package:flutter/material.dart';

class SignaturePadPage extends StatefulWidget {
  const SignaturePadPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignaturePadPage createState() => _SignaturePadPage();
}

class _SignaturePadPage extends State<SignaturePadPage> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            // RenderObject? referenceBox = context.findRenderObject();
            Offset localPosition = (details.globalPosition);
            _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) {
          // _points.add(null),
        },
        child: CustomPaint(painter: SignaturePainter(_points)),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}