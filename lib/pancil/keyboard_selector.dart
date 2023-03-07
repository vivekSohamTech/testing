import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:testing/pancil/drawing_board.dart';

class KeyboardSelector extends StatefulWidget {
  const KeyboardSelector({super.key});

  @override
  State<KeyboardSelector> createState() => _KeyboardSelectorState();
}

class _KeyboardSelectorState extends State<KeyboardSelector> {
  bool isKeyboard = true;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> testLine1 = <String, dynamic>{
      'type': 'StraightLine',
      'startPoint': <String, dynamic>{
        'dx': 68.94337550070736,
        'dy': 62.05980083656557
      },
      'endPoint': <String, dynamic>{
        'dx': 277.1373386828114,
        'dy': 277.32029957032194
      },
      'paint': <String, dynamic>{
        'blendMode': 3,
        'color': 4294198070,
        'filterQuality': 3,
        'invertColors': false,
        'isAntiAlias': false,
        'strokeCap': 1,
        'strokeJoin': 1,
        'strokeWidth': 4.0,
        'style': 1
      }
    };

    void addTestLine() {
      drawingController.addContent(StraightLine.fromJson(testLine1));
      // drawingController
      //     .addContents(<PaintContent>[StraightLine.fromJson(_testLine2)]
      // );
    }

    //Flutter_Image_Compress...!!
    Future<Uint8List> getImageCompress(Uint8List list) async {
      var result = await FlutterImageCompress.compressWithList(list,
          minHeight: 100,
          minWidth: 100,
          quality: 100,
          inSampleSize: 5,
          keepExif: true,
          autoCorrectionAngle: false);
      debugPrint(list.length.toString());
      debugPrint(result.length.toString());
      return result;
    }
    // //Image package...!!
    // Uint8List resizeImage(Uint8List data) {
    //   Uint8List resizedData = data;
    //   IMG.Image? img = IMG.decodeImage(data);
    //   IMG.Image resized = IMG.copyResize(img!,
    //       width: 100, height: 100, interpolation: IMG.Interpolation.average);
    //   resizedData = IMG.encodeJpg(resized);
    //   return resizedData;
    // }

    Future<void> getImageData() async {
      try {
        final data =
            (await drawingController.getImageData())?.buffer.asUint8List();
        debugPrint('==> Data : $data');

        // base64 before compress encoding bytes....!!!
        // var encoded2 = base64.encode(data!);
        // debugPrint('data base64 : $encoded2');

        // get uint8list with compress image....!!!
        var image = await getImageCompress(data!);
        debugPrint('==> Image : ${image.toString()}');

        // // get uint8List with resize image....!!!
        // var image = resizeImage(data!);
        // debugPrint('==> Image : ${image.toString()}');

        // base64 encoding bytes
        var encoded2 = base64.encode(image);
        debugPrint('Encoded 2: $encoded2');

        //Show Compress Image...!!!
        showDialog<void>(
          context: context,
          builder: (BuildContext c) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () => Navigator.pop(c),
                  child: Image.memory(base64Decode(encoded2))),
            );
          },
        );
      } catch (e) {
        debugPrint('ERROR : ${e.toString()}');
      }
    }

    List<TextData> fields = [];
    TextEditingController controller = TextEditingController();

    return KeyboardSizeProvider(
      smallSize: 300,
      child: OrientationBuilder(builder: (context, orientation) {
        return KeyboardSizeProvider(
          smallSize: 500,
          child: Scaffold(
              appBar: AppBar(),
              body: Consumer<ScreenHeight>(
                builder: (context, value, child) => StatefulBuilder(
                  builder: (context, setState) => Column(
                    children: [
                      Expanded(
                          child: TextField(
                        readOnly: !isKeyboard ? true : false,
                      )),
                      Container(
                        color: Colors.amber,
                        height: 100,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          // reverse: true,
                          itemCount: fields.length,
                          itemBuilder: (context, index) {
                            // return SizedBox(
                            //   height: 60,
                            //   child: fields[index].image.isEmpty
                            //       ? Text(fields[index].text ?? '')
                            //       : Image.memory(
                            //           base64Decode(fields[index].image ?? '')),
                            // );
                            return Row(
                              children: [
                                if (fields[index].image.isNotEmpty)
                                  Image.memory(
                                      base64Decode(fields[index].image)),
                                Text(
                                  fields[index].text ?? '',
                                  style: const TextStyle(fontSize: 60),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final controller = TextEditingController();
                              // final field = TextField(
                              //   controller: controller,
                              //   decoration: const InputDecoration(hintText: 'A'),
                              // );

                              setState(() {
                                // textData.add(controller);
                                fields.add(TextData(text: 'A', image: ''));
                              });
                              debugPrint(fields.length.toString());
                            },
                            child: const Text('Text'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final data =
                                  (await drawingController.getImageData())
                                      ?.buffer
                                      .asUint8List();
                              debugPrint('==> Data : $data');

                              var image = await getImageCompress(data!);
                              debugPrint('==> Image : ${image.toString()}');

                              var encoded2 = base64.encode(image);
                              debugPrint('Encoded 2: $encoded2');

                              setState(() {
                                fields.add(TextData(image: encoded2));
                              });
                            },
                            child: const Text('Image'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                fields.removeLast();
                              });
                            },
                            child: const Text('remove'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                FocusScope.of(context).requestFocus();
                              });
                            },
                            child: const Text('unfocus'),
                          )
                        ],
                      ),
                      if (value.isOpen || isKeyboard == false)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: orientation == Orientation.landscape
                                ? MediaQuery.of(context).size.height * 0.09
                                : MediaQuery.of(context).size.height * 0.05,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context).requestFocus();
                                        isKeyboard = true;
                                      });
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Keyboard',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: orientation ==
                                                    Orientation.landscape
                                                ? 12
                                                : 8,
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: isKeyboard
                                                ? const Color.fromARGB(
                                                    255, 2, 87, 16)
                                                : Colors.transparent,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isKeyboard = false;
                                      });
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Custom Symbol',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: orientation ==
                                                    Orientation.landscape
                                                ? 12
                                                : 8,
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: isKeyboard
                                                ? Colors.transparent
                                                : const Color.fromARGB(
                                                    255, 2, 87, 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isKeyboard = true;
                                            FocusScope.of(context).unfocus();
                                          });
                                        },
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)))),
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          // _addTestLine();
                                          getImageData();
                                        },
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        Container(),
                      if (!isKeyboard) const CustomKeyboard()
                    ],
                  ),
                ),
              )),
        );
      }),
    );
  }
}

class TextData {
  String? text;
  String image;
  TextData({required this.image, this.text});
}
