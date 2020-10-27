import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/arguments/adaptive_argument.dart';
import 'package:flutter_app_intermediate/model/joke.dart';
import 'package:flutter_app_intermediate/screens/device_screen.dart';

class AdaptiveScreen extends StatefulWidget {
  static String id = "adaptive";
  @override
  _AdaptiveScreenState createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  Joke pilihanJoke;
  @override
  Widget build(BuildContext context) {
    Widget content;
    var ukuranLayar = MediaQuery.of(context).size.shortestSide;
    var orientasiLayar = MediaQuery.of(context).orientation;
    if (orientasiLayar == Orientation.portrait && ukuranLayar < 600) {
      content = buildNotTablet();
    } else {
      content = buildTablet();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Adaptive"),
      ),
      body: content,
    );
  }

  Widget buildNotTablet() {
    return DeviceScreen(
      jokeCallback: (value) {
        Navigator.pushNamed(context, DetailDevice.id,
            arguments: AdaptiveArgument(false, value));
      },
    );
  }

  Widget buildTablet() {
    return Row(
      children: [
        Flexible(
            child: DeviceScreen(
                jokeCallback: (value) {
                  setState(() {
                    pilihanJoke = value;
                  });
                },
                joke: pilihanJoke)),
        Flexible(child: DetailDevice(
          deviceType: true,
          joke: pilihanJoke,
        ))
      ],
    );
  }
}
