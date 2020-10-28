import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/screens/auth_screen.dart';
import 'package:flutter_app_intermediate/screens/device_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbygoogle_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginbyphone_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/loginemailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/firebase/registeremailpass_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/loginmysql_screen.dart';
import 'package:flutter_app_intermediate/screens/mysql/registermysql_screen.dart';
import 'package:flutter_app_intermediate/screens/splash_screen.dart';

import 'arguments/adaptive_argument.dart';
import 'screens/adaptive_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == DetailDevice.id) {
          AdaptiveArgument argument = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return DetailDevice(
                deviceType: argument.deviceType, joke: argument.joke);
          });
        }
      },
      initialRoute: SplashLoadingScreen.id,
      routes: {
        SplashLoadingScreen.id: (context) => SplashLoadingScreen(),
        AuthScreen.id: (context) => AuthScreen(),
        MenuScreen.id: (context) => MenuScreen(),
        DeviceScreen.id: (context) => DeviceScreen(),
        AdaptiveScreen.id: (context) => AdaptiveScreen(),
        LoginByGoogleScreen.id: (context) => LoginByGoogleScreen(),
        LoginByPhoneScreen.id: (context) => LoginByPhoneScreen(),
        LoginEmailPassScreen.id: (context) => LoginEmailPassScreen(),
        RegisterEmailPassScreen.id: (context) => RegisterEmailPassScreen(),
        LoginMysqlScreen.id: (context) => LoginMysqlScreen(),
        RegisterMysql.id: (context) => RegisterMysql(),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  static String id = "menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AdaptiveScreen.id);
            },
            child: Text("Adaptive Layout"),
          ),
        ],
      ),
    );
  }
}
