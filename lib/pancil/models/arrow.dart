import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';
import 'dart:math' as math;

class Arrow extends PaintContent {
  Arrow();

  Arrow.data({
    required this.startPoint,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.E,
    required this.F,
    required this.G,
    required this.H,
    required Paint paint,
  }) : super.paint(paint);

  factory Arrow.fromJson(Map<String, dynamic> data) {
    return Arrow.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      A: jsonToOffset(data['A'] as Map<String, dynamic>),
      B: jsonToOffset(data['B'] as Map<String, dynamic>),
      C: jsonToOffset(data['C'] as Map<String, dynamic>),
      D: jsonToOffset(data['D'] as Map<String, dynamic>),
      E: jsonToOffset(data['E'] as Map<String, dynamic>),
      F: jsonToOffset(data['F'] as Map<String, dynamic>),
      G: jsonToOffset(data['G'] as Map<String, dynamic>),
      H: jsonToOffset(data['H'] as Map<String, dynamic>),
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }

  Offset startPoint = Offset.zero;

  Offset A = Offset.zero;
  Offset B = Offset.zero;
  Offset C = Offset.zero;
  Offset D = Offset.zero;
  Offset E = Offset.zero;
  Offset F = Offset.zero;
  Offset G = Offset.zero;
  Offset H = Offset.zero;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) {
    const arrowSize = 30;
    const arrowAngle = 25 * math.pi / 180;
    final p1 = startPoint;
    final p2 = nowPoint;
    final dX = p2.dx - p1.dx;
    final dY = p2.dy - p1.dy;
    final angle = math.atan2(dY, dX);

    A = Offset(nowPoint.dx, nowPoint.dy);

    B = Offset(startPoint.dx, startPoint.dy);

    C = Offset(nowPoint.dx, nowPoint.dy);

    D = Offset(p2.dx - arrowSize * math.cos(angle - arrowAngle),
        p2.dy - arrowSize * math.sin(angle - arrowAngle));

    E = Offset(nowPoint.dx, nowPoint.dy);

    F = Offset(p2.dx - arrowSize * math.cos(angle + arrowAngle),
        p2.dy - arrowSize * math.sin(angle + arrowAngle));

    H = Offset(nowPoint.dx, nowPoint.dy);

    G = nowPoint;
  }

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    final Path path = Path()
      ..moveTo(A.dx, A.dy)
      ..lineTo(B.dx, B.dy)
      ..lineTo(C.dx, C.dy)
      ..lineTo(D.dx, D.dy)
      ..lineTo(E.dx, E.dy)
      ..lineTo(F.dx, F.dy)
      ..lineTo(G.dx, G.dy)
      ..lineTo(H.dx, H.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  Arrow copy() => Arrow();

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'startPoint': startPoint.toJson(),
      'A': A.toJson(),
      'B': B.toJson(),
      'C': C.toJson(),
      'D': D.toJson(),
      'E': E.toJson(),
      'F': F.toJson(),
      'G': G.toJson(),
      'H': H.toJson(),
      'paint': paint.toJson(),
    };
  }
}
