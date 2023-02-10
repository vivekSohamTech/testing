import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

class ScribblePackage extends StatefulWidget {
  const ScribblePackage({super.key});

  @override
  State<ScribblePackage> createState() => _ScribblePackageState();
}

class _ScribblePackageState extends State<ScribblePackage> {
  ScribbleNotifier notifier = ScribbleNotifier();
  List circleList = [];
  double scale = 20;

  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: GestureDetector(
                            onScaleStart: (ScaleStartDetails details) {},
                            onScaleUpdate: (ScaleUpdateDetails details) {
                              setState(() {
                                scale = details.scale;
                              });
                            },
                            child: Scribble(
                              drawPen: false,
                              drawEraser: true,
                              notifier: notifier,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed:
                                  notifier.canUndo ? notifier.undo : null,
                              icon: Icon(Icons.undo,
                                  color: notifier.canUndo
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            IconButton(
                              onPressed:
                                  notifier.canRedo ? notifier.redo : null,
                              icon: Icon(Icons.redo,
                                  color: notifier.canRedo
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            IconButton(
                              onPressed: notifier.clear,
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Click Me')),
        ),
        const SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}
