import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class HorizontalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HorizontalListState();
  }
}

class HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Colors.red,
              width: screenSize.width / 4,
              height: screenSize.height,
            ),
            Container(
              color: Colors.blue,
              width: screenSize.width / 3,
              height: screenSize.height,
            ),
            Container(
              color: Colors.green,
              width: screenSize.width / 2,
              height: screenSize.height,
            ),
            Container(
              color: Colors.yellowAccent,
              width: screenSize.width,
              height: screenSize.height,
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "", home: HorizontalList());
  }
}
