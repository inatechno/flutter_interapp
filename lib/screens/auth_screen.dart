import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_intermediate/helpers/rounded_button.dart';
import 'package:flutter_app_intermediate/main.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbygoogle_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbyphone_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginemailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/registeremailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/loginmysql_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/registermysql_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  static String id = "auth";
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: Column(
        children: [
          RoundedButton(
            color: Colors.brown,
            text: "Login Email/Pass",
            callback: () {
              Navigator.pushNamed(context, LoginEmailPassScreen.id);
            },
          ),
          RoundedButton(
            color: Colors.brown,
            text: "Login By Google",
            callback: () {
              loginbyGoogle();
            },
          ),
          RoundedButton(
            color: Colors.brown,
            text: "Login By Phone",
            callback: () {
              Navigator.pushNamed(context, LoginByPhoneScreen.id);
            },
          ),
          RoundedButton(
            color: Colors.brown,
            text: "Login MySql",
            callback: () {
              Navigator.pushNamed(context, LoginMysqlScreen.id);
            },
          ),
          Center(child: Text("OR")),
          RoundedButton(
            color: Colors.brown,
            text: "Register Email/Pass",
            callback: () {
              Navigator.pushNamed(context, RegisterEmailPassScreen.id);
            },
          ),
          RoundedButton(
            color: Colors.brown,
            text: "Register MySql",
            callback: () {
              Navigator.pushNamed(context, RegisterMysql.id);
            },
          ),
        ],
      ),
    );
  }

  loginbyGoogle() async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        userCredential = await auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      Navigator.pushNamed(context, MenuScreen.id);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Sign In ${user.uid} with Google"),
      ));
    } catch (e) {
      print(e);

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Google: ${e}"),
      ));
    }
  }
}
