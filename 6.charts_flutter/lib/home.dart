import 'package:ChartsFlutter/chart.dart';
import 'package:ChartsFlutter/row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
//  final List<XY> data = [
//    XY(x: 1, y: 2, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
//    XY(x: 5, y: 2, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
//    XY(x: 2, y: 12, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
//    XY(x: 31, y: 22, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
//    XY(x: 31, y: 9, barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
//  ];
  final data = [
//    new MyRow(new DateTime(2017, 9, 25), 106),
//    new MyRow(new DateTime(new DateFormat("dd/MM/yyyy HH:mm:ss").parse("10/02/2000 15:13:09")), 286.138),
        new MyRow(new DateTime(2017,02,03,9,00,00), 286.138-273),
        new MyRow(new DateTime(2017,02,03,12,00,00), 286.138-273),
        new MyRow(new DateTime(2017,02,04,3,00,00), 286.302),
        new MyRow(new DateTime(2017,02,04,3,00,00), 286.42),
//        new MyRow(new DateTime(2017,02,04,06,00,00), 285.952),
//        new MyRow(new DateTime(2017,02,04,9,00,00), 286.002),
//    new MyRow(new DateTime(2017, 9, 25, 1, 2, 0), 108),
//    new MyRow(new DateTime(2017, 9, 25, 1, 8, 0), 102),
//    new MyRow(new DateTime(2017, 9, 25, 2, 8, 0), 106),
//    new MyRow(new DateTime(2017, 9, 26), 108),
//    new MyRow(new DateTime(2017, 9, 27), 106),
//    new MyRow(new DateTime(2017, 9, 28), 109),
//    new MyRow(new DateTime(2017, 9, 29), 109),
//    new MyRow(new DateTime(2017, 9, 30), 115),
//    new MyRow(new DateTime(2017, 10, 01), 125),
//    new MyRow(new DateTime(2017, 10, 02), 133),
//    new MyRow(new DateTime(2017, 10, 03), 127),
//    new MyRow(new DateTime(2017, 10, 04), 131),
//    new MyRow(new DateTime(2017, 10, 05), 123),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 399,
          width: MediaQuery.of(context).size.width * 3,
          child: Center(
            child: Chart(
              data: data,
            ),
          ),
        ),
      ),
    );
  }
}
