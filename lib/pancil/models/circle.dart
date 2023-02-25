import 'package:flutter/painting.dart';
import 'package:flutter_drawing_board/src/paint_extension/ex_offset.dart';
import 'package:flutter_drawing_board/src/paint_extension/ex_paint.dart';
import 'package:testing/pancil/models/paint_containt.dart';

/// 圆
class Circler extends PaintContenting {
  Circler({
    this.isEllipse = false,
    this.startFromCenter = true,
  });

  Circler.data({
    this.isEllipse = false,
    this.startFromCenter = true,
    required this.center,
    required this.radius,
    required this.startPoint,
    required this.endPoint,
    required Paint paint,
  }) : super.paint(paint);

  factory Circler.fromJson(Map<String, dynamic> data) {
    return Circler.data(
      isEllipse: data['isEllipse'] as bool,
      startFromCenter: data['startFromCenter'] as bool,
      center: jsonToOffset(data['center'] as Map<String, dynamic>),
      radius: data['radius'] as double,
      startPoint: jsonToOffset(data['startPoint'] as Map<String, dynamic>),
      endPoint: jsonToOffset(data['endPoint'] as Map<String, dynamic>),
      paint: jsonToPaint(data['paint'] as Map<String, dynamic>),
    );
  }

  final bool isEllipse;

  final bool startFromCenter;

  Offset center = Offset.zero;

  double radius = 0;

  Offset startPoint = Offset.zero;

  Offset endPoint = Offset.zero;

  @override
  void startDraw(Offset startPoint) {
    this.startPoint = startPoint;
    center = startPoint;
  }

  @override
  void drawing(Offset nowPoint) {
    endPoint = nowPoint;
    center = Offset(
        (startPoint.dx + endPoint.dx) / 2, (startPoint.dy + endPoint.dy) / 2);
    radius = (endPoint - (startFromCenter ? startPoint : center)).distance;
  }

  @override
  void draw(Canvas canvas, Size size, bool deeper) {
    if (isEllipse) {
      canvas.drawOval(Rect.fromPoints(startPoint, endPoint), paint);
      
    } else {
      canvas.drawCircle(startFromCenter ? startPoint : center, radius, paint);
    }
  }

  @override
  Circler copy() => Circler(isEllipse: isEllipse);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': 'Circle',
      'isEllipse': isEllipse,
      'startFromCenter': startFromCenter,
      'center': center.toJson(),
      'radius': radius,
      'startPoint': startPoint.toJson(),
      'endPoint': endPoint.toJson(),
      'paint': paint.toJson(),
    };
  }
}
