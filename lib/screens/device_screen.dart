import 'package:flutter/material.dart';
import 'package:flutter_app_intermediate/model/joke.dart';

class DeviceScreen extends StatefulWidget {
  static String id = "device";
  Joke joke;
  ValueChanged<Joke> jokeCallback;

  DeviceScreen({Key key, this.joke, this.jokeCallback}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((itemJoke) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: ListTile(
            onTap: () => widget.jokeCallback(itemJoke),
            selected: widget.joke == itemJoke,
            title: Text(
              itemJoke.setup,
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DetailDevice extends StatelessWidget {
  static String id = "detaildevice";

  bool deviceType;
  Joke joke;
  DetailDevice({Key key, this.deviceType, this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        Text(joke?.setup ?? "belum dipilih",
         style: TextStyle(fontSize: 25)),
        Text(joke?.punchline ?? "belum dipilih",
            style: TextStyle(fontSize: 28,
             fontWeight: FontWeight.bold)),
      ],
    );
    if (deviceType == true) {
      return Center(
        child: content,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(joke?.type ?? " belum dipilih"),
        ),
        body: Center(
          child: content,
        ),
        backgroundColor: Colors.yellow,
      );
    }
   
  }
}
