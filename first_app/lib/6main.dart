import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '6mainPage.dart';

//Drawer
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "", home: MainPage());
  }
}
