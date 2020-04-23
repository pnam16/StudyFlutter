import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Homepage(),
    );
  }
}
