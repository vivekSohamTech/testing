import 'package:flutter/material.dart';
import 'package:testing/flutter_shapes_star.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform );
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TypesPage(),
      // home: AppField(),
    );
  }
}



// class AppField extends StatefulWidget {
//   const AppField({super.key});

//   @override
//   State<AppField> createState() => _AppFieldState();
// }

// class _AppFieldState extends State<AppField> {
//   @override
//   Widget build(BuildContext context) {
//     // List textData = [];
//     List<TextData> fields = [];
//     TextEditingController controller = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: StatefulBuilder(
//           builder: (context, setState) => Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: controller,
//               ),
//               Container(
//                 color: Colors.amber,
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: fields.length,
//                   itemBuilder: (context, index) {
//                     // return SizedBox(
//                     //   height: 60,
//                     //   child: fields[index].image.isEmpty
//                     //       ? Text(fields[index].text ?? '')
//                     //       : Image.memory(
//                     //           base64Decode(fields[index].image ?? '')),
//                     // );
//                     return Row(
//                       children: [
//                         Image.memory(base64Decode(fields[index].image ?? '')),
//                         Text(fields[index].text ?? ''),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       final controller = TextEditingController();
//                       // final field = TextField(
//                       //   controller: controller,
//                       //   decoration: const InputDecoration(hintText: 'A'),
//                       // );

//                       setState(() {
//                         // textData.add(controller);
//                         fields.add(TextData(text: 'A'));
//                       });
//                       debugPrint(fields.length.toString());
//                     },
//                     child: const Text('Text'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         fields.add(TextData(
//                             image:
//                                 '/9j/4QBYRXhpZgAATU0AKgAAAAgABAEAAAQAAAABAAAAdAEBAAQAAAABAAAAZIdpAAQAAAABAAAAPgESAAQAAAABAAAAAAAAAAAAAZIIAAQAAAABAAAAAAAAAAD/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAIQAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3BhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADTLW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAwADEANv/bAEMAAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAf/bAEMBAQEBAQEBAQEBAQEBAQEBAQEBAQEB'));
//                       });
//                     },
//                     child: const Text('Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         fields.removeLast();
//                       });
//                     },
//                     child: const Text('remove'),
//                   )
//                 ],
//               ),
//               // Image.memory(jsonDecode('')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TextData {
//   String? text;
//   String? image;
//   TextData({this.image, this.text});
// }
