import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/paint_extension.dart';

import 'models/triangle.dart';

final DrawingController drawingController = DrawingController();

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  var style = const TextStyle(fontSize: 18);
  var iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    drawingController.setStyle(
        color: Colors.black,
        strokeWidth: 12,
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
                            drawingController.setPaintContent = Circle();
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
                          onPressed: () {},
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
                              'asset/devider.png',
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
                          onPressed: () {},
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
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                    child: DrawingBoard(
                      alignment: Alignment.center,
                      boardConstrained: true,
                      boardPanEnabled: false,
                      boardAlignPanAxis: true,
                      boardBoundaryMargin: const EdgeInsets.all(100),
                      controller: drawingController,
                      background: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      showDefaultActions: false,
                      showDefaultTools: false,
                      boardScaleEnabled: false,
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
