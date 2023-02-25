import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

class Triangle_5 extends PaintContent {
  Triangle_5();

  Triangle_5.data({
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
    required this.K,
    required Paint paint,
  }) : super.paint(paint);

  factory Triangle_5.fromJson(Map<String, dynamic> data) {
    return Triangle_5.data(
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
      K: jsonToOffset(data['K'] as Map<String, dynamic>),
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
  Offset K = Offset.zero;

  @override
  void startDraw(Offset startPoint) => this.startPoint = startPoint;

  @override
  void drawing(Offset nowPoint) {
    debugPrint(nowPoint.toString());
    debugPrint(startPoint.toString());

    A = Offset(
        startPoint.dx + (nowPoint.dx - startPoint.dx) / 2, startPoint.dy);
    debugPrint('==> A : ${A.toString()}');

    B = Offset(startPoint.dx, nowPoint.dy);
    debugPrint('==> B : ${B.toString()}');

    C = Offset(
        startPoint.dx - (nowPoint.dx - startPoint.dx + 40) / 2, nowPoint.dy);
    debugPrint('==> C : ${C.toString()}');

    D = Offset(nowPoint.dx + (nowPoint.dx - startPoint.dx) / 3,
        nowPoint.dy + (nowPoint.dx - startPoint.dx + 50) / 2);
    debugPrint('==> D : ${D.toString()}');

    E = Offset(startPoint.dx - 20, startPoint.dy);
    debugPrint('==> E : ${E.toString()}');

    F = Offset(startPoint.dx - (nowPoint.dx - startPoint.dx) / 2,
        startPoint.dy + (nowPoint.dx - startPoint.dx - 30) / 2);
    debugPrint('==> F : ${F.toString()}');

    G = Offset(startPoint.dx - (nowPoint.dx - startPoint.dx) / 2,
        startPoint.dy + (nowPoint.dx - startPoint.dx - 30) / 2);
    debugPrint('==> G : ${G.toString()}');

    H = Offset(
        startPoint.dx + (nowPoint.dx - startPoint.dx) / 2, startPoint.dy);
    debugPrint('==> H : ${H.toString()}');

    I = Offset(
        nowPoint.dx + (nowPoint.dx - startPoint.dx) / 2, startPoint.dy - 20);
    debugPrint('==> I : ${I.toString()}');

    J = Offset(
        startPoint.dx + (nowPoint.dx - startPoint.dx) / 2, startPoint.dy + 40);
    debugPrint('==> J : ${J.toString()}');

    K = nowPoint;
    debugPrint('==> E : ${E.toString()}');
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
      ..lineTo(K.dx, K.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  Triangle_5 copy() => Triangle_5();

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
      'K': K.toJson(),
      'paint': paint.toJson(),
    };
  }
}
