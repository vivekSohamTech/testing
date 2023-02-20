import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInDemo extends StatelessWidget {
  const GoogleSignInDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            GoogleSignInApi.login();
          }, child: const Text('sign_In'))
        ],
      ),
    );
  }
}


class GoogleSignInApi{
  static final googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount? > login() => googleSignIn.signIn();
}