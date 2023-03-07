import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController textController = TextEditingController();
  // String? data;
  bool isKeyboard = true;
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textController,
                onChanged: (value) {
                  try {
                    data.clear();
                    suggesion.where((sugge) {
                      if (sugge.contains(RegExp('^$value'))) {
                        debugPrint('===>$sugge');
                        data.add(sugge);
                      }
                      if (value.isEmpty) {
                        data.clear();
                      }
                      return true;
                    }).toList();
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  if (data.isNotEmpty) {
                    debugPrint('==>${data.first ?? ''}');
                    debugPrint('\n');
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Exter Something Here....!!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var data = FirebaseAuth.instance;
                  data.sendPasswordResetEmail(email: 'jaganivivek5@jmail.com');
                },
                child: const Text('data'))
          ],
        ),
      ),
    );
  }
}

List suggesion = ['ABWERTYYX', 'ABCDBNMCI', 'ABCDEFGOP', 'ABCDEFGHILK'];
