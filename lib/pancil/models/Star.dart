import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

class Star extends PaintContent {
  Star();

  Star.data({
    required this.startPoint,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.E,
    required this.F,
    required this.G,
    required this.H,
    required this.I,
    required this.J,
    required Paint paint,
  }) : super.paint(paint);

  factory Star.fromJson(Map<String, dynamic> data) {
    return Star.data(
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      A: jsonToOffset(data['A'] as Map<String, dynamic>),
      B: jsonToOffset(data['B'] as Map<String, dynamic>),
      C: jsonToOffset(data['C'] as Map<String, dynamic>),
      D: jsonToOffset(data['D'] as Map<String, dynamic>),
      E: jsonToOffset(data['E'] as Map<String, dynamic>),
      F: jsonToOffset(data['F'] as Map<String, dynamic>),
      G: jsonToOffset(data['G'] as Map<String, dynamic>),
      H: jsonToOffset(data['H'] as Map<String, dynamic>),
      I: jsonToOffset(data['I'] as Map<String, dynamic>),
      J: jsonToOffset(data['J'] as Map<String, dynamic>),
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
  Offset I = Offset.zero;
  Offset J = Offset.zero;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) {
    A = Offset(startPoint.dx, startPoint.dy + 50);
    debugPrint('==> A : ${A.toString()}');

    B = Offset(startPoint.dx, nowPoint.dy - 200);
    debugPrint('==> B : ${B.toString()}');

    C = Offset(nowPoint.dx - 100, nowPoint.dy);
    debugPrint('==> C : ${C.toString()}');

    D = Offset(startPoint.dx + 50, nowPoint.dy - 100);
    debugPrint('==> D : ${D.toString()}');

    E = Offset(startPoint.dx + 200, nowPoint.dy - 100);
    debugPrint('==> E : ${E.toString()}');

    F = Offset(startPoint.dx + 50, nowPoint.dy - 120);
    debugPrint('==> F : ${F.toString()}');

    G = Offset(startPoint.dx + 50, nowPoint.dy - 150);
    debugPrint('==> G : ${G.toString()}');

    H = Offset(startPoint.dx + 50, nowPoint.dy - 230);
    debugPrint('==> H : ${H.toString()}');

    I = Offset(startPoint.dx + 50, nowPoint.dy - 100);
    debugPrint('==> I : ${I.toString()}');

    J = nowPoint;
    debugPrint('==> E : ${J.toString()}');
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
      ..lineTo(I.dx, I.dy)
      
      ..lineTo(J.dx, J.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  Star copy() => Star();

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
      'I': I.toJson(),
      'J': J.toJson(),
      'paint': paint.toJson(),
    };
  }
}
