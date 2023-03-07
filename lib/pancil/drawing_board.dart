import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:testing/pancil/models/Star.dart';
import 'package:testing/pancil/models/arrow.dart';

import 'models/triangle.dart';

final DrawingController drawingController = DrawingController();

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  // var style = const TextStyle(fontSize: 18);
  // var iconSize = 30.0;
  var style = const TextStyle(fontSize: 18);
  var iconSize = 30.0;
  Canvas? canvas;
  Paint? paint;
  Offset? center;
  double? angle;
  var radius;
  void drawStar(int num, {double initialAngle = 0}) {
    rotate(() {
      final Path path = Path();
      for (int i = 0; i < num; i++) {
        final double radian = radians(initialAngle + 360 / num * i.toDouble());
        final double x = radius * (i.isEven ? 0.5 : 1) * cos(radian);
        final double y = radius * (i.isEven ? 0.5 : 1) * sin(radian);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas!.drawPath(path, paint!);
    });
  }

  void rotate(VoidCallback callback) {
    canvas!.save();
    canvas!.translate(center!.dx, center!.dy);
    canvas!.rotate(angle ?? 0);
    callback();
    canvas!.restore();
  }

  @override
  Widget build(BuildContext context) {
    drawingController.setStyle(
        color: Colors.black,
        strokeWidth: 2,
        isAntiAlias: true,
        style: PaintingStyle.stroke,
        strokeCap: StrokeCap.round);

    return Expanded(
      child: SizedBox(
        height: 100,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: const Color.fromRGBO(170, 217, 255, 1),
                  child: Column(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          onPressed: () {
                            drawingController.setPaintContent = SimpleLine();
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.mode_edit_outline_outlined,
                              size: iconSize,
                            ),
                            title: Text(
                              'Pen',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          onPressed: () {
                            drawingController.setPaintContent = Rectangle();
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.square_outlined,
                              size: iconSize,
                            ),
                            title: Text(
                              'Rectangle',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            drawingController.setPaintContent =
                                Circle(isEllipse: false);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          child: ListTile(
                            leading: Icon(
                              Icons.panorama_fisheye_rounded,
                              size: iconSize,
                            ),
                            title: Text(
                              'Elipse',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          onPressed: () {
                            drawingController.setPaintContent = Triangle();
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.change_history_outlined,
                              size: iconSize,
                            ),
                            title: Text(
                              'Polygon',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // drawingController.setPaintContent = Star();
                            // drawStar()
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          child: ListTile(
                            leading: Icon(
                              Icons.star_border_outlined,
                              size: iconSize,
                            ),
                            title: Text(
                              'Star',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            drawingController.setPaintContent = StraightLine();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          child: ListTile(
                            leading: Image.asset(
                              'asset/divider.png',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              'Line',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(170, 217, 255, 1),
                          )),
                          onPressed: () {
                            drawingController.setPaintContent = Arrow();
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.call_made_outlined,
                              size: iconSize,
                            ),
                            title: Text(
                              'Arrow',
                              style: style,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 100),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      radius: const Radius.circular(20),
                      dashPattern: const [15, 10],
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          DrawingBoard(
                            alignment: Alignment.center,
                            boardConstrained: true,
                            boardPanEnabled: false,
                            boardAlignPanAxis: true,
                            boardBoundaryMargin: const EdgeInsets.all(100),
                            controller: drawingController,
                            background: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            showDefaultActions: false,
                            showDefaultTools: false,
                            boardScaleEnabled: false,
                          ),
                          Text(
                            'Draw Here',
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                wordSpacing: 8,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            Positioned(
              top: 12,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          drawingController.undo();
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          drawingController.redo();
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            drawingController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
