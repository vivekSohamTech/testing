import 'package:flutter/material.dart';
import '../pancil/image_paint.dart';

class Controller extends ChangeNotifier {
  late double _strokeWidth;
  late Color _color;
  late PaintingStyle _style;
  late String _text;

  final List<Offset?> _offsets = [];

  final List<PaintInfo> _paintHistory = [];

  Offset? _start, _end;

  int _strokeMultiplier = 1;
  bool _paintInProgress = false;

  Paint get brush => Paint()
    ..color = _color
    ..strokeWidth = _strokeWidth * _strokeMultiplier;

  double get strokeWidth => _strokeWidth;

  bool get busy => _paintInProgress;

  Color get color => _color;

  List<PaintInfo> get paintHistory => _paintHistory;

  List<Offset?> get offsets => _offsets;

  Offset? get start => _start;

  Offset? get end => _end;

  Controller({
    double strokeWidth = 4.0,
    Color color = const Color.fromARGB(255, 255, 186, 182),
    PaintingStyle style = PaintingStyle.stroke,
    String text = '',
  }) {
    _strokeWidth = strokeWidth;
    _color = color;
    _style = style;
    _text = text;
  }

  void undo() {
    if (_paintHistory.isNotEmpty) {
      _paintHistory.removeLast();
      notifyListeners();
    }
  }

  void clear() {
    if (_paintHistory.isNotEmpty) {
      _paintHistory.clear();
      notifyListeners();
    }
  }

  void setStrokeWidth(double val) {
    _strokeWidth = val;
    notifyListeners();
  }

  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  void setText(String val) {
    _text = val;
    notifyListeners();
  }

  void addOffsets(Offset? offset) {
    _offsets.add(offset);
    notifyListeners();
  }

  void setStart(Offset? offset) {
    _start = offset;
    notifyListeners();
  }

  void setEnd(Offset? offset) {
    _end = offset;
    notifyListeners();
  }

  void resetStartAndEnd() {
    _start = null;
    _end = null;
    notifyListeners();
  }

  void update(
      {double? strokeWidth,
      Color? color,
      PaintingStyle? style,
      String? text,
      int? strokeMultiplier}) {
    _strokeWidth = strokeWidth ?? _strokeWidth;
    _color = color ?? _color;
    _style = style ?? _style;
    _text = text ?? _text;
    _strokeMultiplier = strokeMultiplier ?? _strokeMultiplier;
    notifyListeners();
  }

  void setInProgress(bool val) {
    _paintInProgress = val;
    notifyListeners();
  }
}
