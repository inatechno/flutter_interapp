import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/helpers/constant.dart';
import 'package:flutter_app_intermediate/helpers/rounded_button.dart';
import 'package:toast/toast.dart';

import 'loginemailpass_screen.dart';

class RegisterEmailPassScreen extends StatefulWidget {
  static String id = "registeremailpass";
  @override
  _RegisterEmailPassScreenState createState() =>
      _RegisterEmailPassScreenState();
}

class _RegisterEmailPassScreenState extends State<RegisterEmailPassScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, password;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "enter your email"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "enter your password"),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                text: "register",
                color: Colors.brown,
                callback: () {
                  prosesRegister();
                },
              )
            ],
          ),
        ));
  }

  Future<void> prosesRegister() async {
    loading = true;
    User user = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      setState(() {
        loading = false;
      });
      //kirim kode untuk verifikasi email yang didaftarkan
      user.sendEmailVerification();
      Navigator.popAndPushNamed(context, LoginEmailPassScreen.id);
      Toast.show("Berhasil Register,silahkan periksa email anda", context);
    } else {
      setState(() {
        loading = false;
      });
      Toast.show("Gagal Register", context);
    }
  }
}
