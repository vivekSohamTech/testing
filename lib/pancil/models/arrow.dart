import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

class Arrow extends PaintContent {
  Arrow();

  Arrow.data({
    required this.startPoint,
    required this.A,
    required this.B,
    // required this.C,
    // required this.D,
    // required this.E,
    // required this.F,
    required this.G,
    required Paint paint,
  }) : super.paint(paint);

  factory Arrow.fromJson(Map<String, dynamic> data) {
    return Arrow.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      A: jsonToOffset(data['A'] as Map<String, dynamic>),
      B: jsonToOffset(data['B'] as Map<String, dynamic>),
      // C: jsonToOffset(data['C'] as Map<String, dynamic>),
      // D: jsonToOffset(data['D'] as Map<String, dynamic>),
      // E: jsonToOffset(data['E'] as Map<String, dynamic>),
      // F: jsonToOffset(data['F'] as Map<String, dynamic>),
      G: jsonToOffset(data['G'] as Map<String, dynamic>),
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }

  Offset startPoint = Offset.zero;

  Offset A = Offset.zero;
  Offset B = Offset.zero;
  // Offset C = Offset.zero;
  // Offset D = Offset.zero;
  // Offset E = Offset.zero;
  // Offset F = Offset.zero;
  Offset G = Offset.zero;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) {
    debugPrint(startPoint.toString());
    debugPrint(nowPoint.toString());

    A = Offset(nowPoint.dx, startPoint.dy);
    debugPrint('==> A : ${A.toString()}');

    B = Offset(startPoint.dx, nowPoint.dy);
    debugPrint('==> B : ${B.toString()}');

    // C = Offset(nowPoint.dx, startPoint.dy + 30);
    // debugPrint('==> C : ${C.toString()}');

    // D = Offset(startPoint.dx + 30, nowPoint.dy);
    // debugPrint('==> D : ${D.toString()}');

    // E = Offset(nowPoint.dx, startPoint.dy - 30);
    // debugPrint('==> E : ${E.toString()}');

    // F = Offset(startPoint.dx - 30, nowPoint.dy);
    // debugPrint('==> F : ${F.toString()}');

    G = startPoint;
    debugPrint('==> G : ${G.toString()}');
  }

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    final Path path = Path()
      ..moveTo(A.dx, A.dy)
      ..lineTo(B.dx, B.dy)
      // ..lineTo(C.dx, C.dy)
      // ..lineTo(D.dx, D.dy)
      // ..lineTo(E.dx, E.dy)
      // ..lineTo(F.dx, F.dy)
      ..lineTo(G.dx, G.dy)
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
      // 'C': C.toJson(),
      // 'D': D.toJson(),
      // 'E': E.toJson(),
      // 'F': F.toJson(),
      'G': G.toJson(),
      'paint': paint.toJson(),
    };
  }
}
