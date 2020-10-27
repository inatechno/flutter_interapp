import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/helpers/rounded_button.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbygoogle_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbyphone_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginemailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/registeremailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/loginmysql_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/registermysql_screen.dart';

class AuthScreen extends StatefulWidget {
  static String id = "auth";
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              Navigator.pushNamed(context, LoginByGoogleScreen.id);
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
}
