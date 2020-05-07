import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '7loginPage.dart';

//7. TextField/ text input
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: LoginPage(),
    );
  }
}
