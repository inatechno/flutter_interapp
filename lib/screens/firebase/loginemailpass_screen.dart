import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/helpers/constant.dart';
import 'package:flutter_app_intermediate/helpers/rounded_button.dart';
import 'package:flutter_app_intermediate/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginEmailPassScreen extends StatefulWidget {
  static String id = "loginemailpass";
  @override
  _LoginEmailPassScreenState createState() => _LoginEmailPassScreenState();
}

class _LoginEmailPassScreenState extends State<LoginEmailPassScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, password;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlutterLogo(
                size: 80,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "enter your email"),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "enter your password"),
            ),
            SizedBox(
              height: 8,
            ),
            RoundedButton(
              text: "Login",
              color: Colors.orange,
              callback: () {
                prosesLogin();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> prosesLogin() async {
    loading = true;
    try {
      User user = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user.emailVerified) {
        setState(() {
          loading = false;
        });
        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setBool("sesi", true);
        preferences.setString("email", user.email);
        Navigator.popAndPushNamed(context, MenuScreen.id);
        Toast.show("Berhasil Login", context);
      } else {
        setState(() {
          loading = false;
        });
        Toast.show("Gagal Login,cek email anda untuk verifikasi", context);
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      Toast.show("Gagal Login,$e", context, duration: Toast.LENGTH_LONG);
    }
  }
}
