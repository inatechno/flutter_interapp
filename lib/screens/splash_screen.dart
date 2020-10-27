import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'auth_screen.dart';

class SplashLoadingScreen extends StatelessWidget {
  static String id = "splash";
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      title: Text("Welcome to firebase flutter"),
      image: Image.network(
          "https://i.pinimg.com/originals/90/80/60/9080607321ab98fa3e70dd24b2513a20.gif"),
      backgroundColor: Colors.blue,
      loaderColor: Colors.white,
      photoSize: 120,
      navigateAfterSeconds: cekSessionLogin(context),
    );
  }

  Future cekSessionLogin(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool sesi = (preferences.getBool("sesi") ?? false);
    if (sesi == true) {
      Navigator.pushReplacementNamed(context, MenuScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, AuthScreen.id);
    }
  }
}
