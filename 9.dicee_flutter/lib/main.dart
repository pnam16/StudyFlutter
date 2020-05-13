import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  var total;

  void dicee() {
    setState(
      () {
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => dicee(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image.asset('images/dice$leftDiceNumber.png'))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Image.asset('images/dice$rightDiceNumber.png'))),
            ],
          ),
          SizedBox(height: 100),
          Icon(Icons.fingerprintd, size: 90.0, color: Colors.white),
          SizedBox(height: 20),
          Text(
            "Tap to Roll",
            style: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
