// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image/image.dart' as IMG;
// import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
// import 'package:testing/pancil/drawing_board.dart';

// class Testing extends StatefulWidget {
//   const Testing({super.key});

//   @override
//   State<Testing> createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
//   bool isKeyboard = true;
//   @override
//   Widget build(BuildContext context) {
//     // Future<Uint8List> testComporessList(Uint8List list) async {
//     //   var result = await FlutterImageCompress.compressWithList(
//     //     list,
//     //     minHeight: 100,
//     //     minWidth: 100,
//     //   );
//     //   debugPrint(list.length.toString());
//     //   debugPrint(result.length.toString());
//     //   return result;
//     // }

//     Uint8List resizeImage(Uint8List data) {
//       Uint8List resizedData = data;
//       IMG.Image? img = IMG.decodeImage(data);
//       IMG.Image resized = IMG.copyResize(img!, width: 150, height: 200);
//       resizedData = IMG.encodeJpg(resized);
//       return resizedData;
//     }

//     Future<void> getImageData() async {
//       try {
//         final data =
//             (await drawingController.getImageData())?.buffer.asUint8List();
//         debugPrint('==> Data : $data');

//         // base64 before compress encoding bytes....!!!
//         // var encoded2 = base64.encode(data!);
//         // debugPrint('data base64 : $encoded2');

//         // get uint8list with compress image....!!!
//         // var image = await testComporessList(data!);
//         // debugPrint('==> Image : ${image.toString()}');

//         // get uint8List with resize image....!!!
//         var image = resizeImage(data!);
//         debugPrint('==> Image : ${image.toString()}');

//         // base64 encoding bytes
//         var encoded2 = base64.encode(image);
//         debugPrint('Encoded 2: $encoded2');

//         showDialog<void>(
//           context: context,
//           builder: (BuildContext c) {
//             return Material(
//               color: Colors.transparent,
//               child: InkWell(
//                   onTap: () => Navigator.pop(c),
//                   child: Image.memory(base64Decode(encoded2))),
//             );
//           },
//         );
//       } catch (e) {
//         debugPrint('ERROR : ${e.toString()}');
//       }
//     }

//     return KeyboardSizeProvider(
//       smallSize: 300,
//       child: OrientationBuilder(builder: (context, orientation) {
//         return KeyboardSizeProvider(
//           smallSize: 500,
//           child: Scaffold(
//               appBar: AppBar(),
//               body: Consumer<ScreenHeight>(
//                 builder: (context, value, child) => Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       readOnly: !isKeyboard ? true : false,
//                     )),
//                     if (value.isOpen || isKeyboard == false)
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: SizedBox(
//                           height: orientation == Orientation.landscape
//                               ? MediaQuery.of(context).size.height * 0.09
//                               : MediaQuery.of(context).size.height * 0.05,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Row(
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       FocusScope.of(context).requestFocus();
//                                       isKeyboard = true;
//                                     });
//                                   },
//                                   child: SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.2,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Text(
//                                           'Keyboard',
//                                           style: TextStyle(fontSize: 22),
//                                         ),
//                                         SizedBox(
//                                           height: orientation ==
//                                                   Orientation.landscape
//                                               ? 12
//                                               : 8,
//                                         ),
//                                         Divider(
//                                           thickness: 5,
//                                           color: isKeyboard
//                                               ? const Color.fromARGB(
//                                                   255, 2, 87, 16)
//                                               : Colors.transparent,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       isKeyboard = false;
//                                     });
//                                   },
//                                   child: SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.2,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Text(
//                                           'Custom Symbol',
//                                           style: TextStyle(fontSize: 22),
//                                         ),
//                                         SizedBox(
//                                           height: orientation ==
//                                                   Orientation.landscape
//                                               ? 12
//                                               : 8,
//                                         ),
//                                         Divider(
//                                           thickness: 5,
//                                           color: isKeyboard
//                                               ? Colors.transparent
//                                               : const Color.fromARGB(
//                                                   255, 2, 87, 16),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.15,
//                                     child: ElevatedButton(
//                                       style: ButtonStyle(
//                                           elevation:
//                                               MaterialStateProperty.all(0),
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.transparent)),
//                                       child: const Text(
//                                         'Close',
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.blue),
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           isKeyboard = true;
//                                           FocusScope.of(context).unfocus();
//                                         });
//                                       },
//                                     )),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.15,
//                                     child: ElevatedButton(
//                                       style: ButtonStyle(
//                                           shape: MaterialStateProperty.all(
//                                               RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)))),
//                                       child: const Text(
//                                         'Add',
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       onPressed: () {
//                                         getImageData();
//                                       },
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     else
//                       Container(),
//                     if (!isKeyboard) const CustomKeyboard()
//                   ],
//                 ),
//               )),
//         );
//       }),
//     );
//   }
// }
