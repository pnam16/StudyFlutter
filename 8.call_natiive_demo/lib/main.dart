import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: BackgroundImage(),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  static const platform = const MethodChannel('wallpaper');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("heeeeeee")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: _pressed(),
        elevation: 5.0,
        tooltip: "Set",
      ),
    );
  }

  _pressed() {
    platform.invokeMethod("channel", {
      "key": "123123(value)",
    }).then((value) => {
      print(value)
    });
  }
}
