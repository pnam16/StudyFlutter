import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class XY {
  final int x;
  final int y;
  final charts.Color barColor;

  XY({
    @required this.x,
    @required this.y,
    @required this.barColor,
  });
}
