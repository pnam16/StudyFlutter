import 'package:ChartsFlutter/row.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//class Chart extends StatelessWidget {
//  final List<XY> data;
//
//  Chart({@required this.data});
//
//  @override
//  Widget build(BuildContext context) {
//    List<charts.Series<XY, String>> series = [
//      charts.Series(
//          id: "XXX",
//          data: data,
//          domainFn: (XY series, _) => series.x.toString(),
//          measureFn: (XY series, _) => series.y,
//          colorFn: (XY series, _) => series.barColor)
//    ];
////    return charts.BarChart(series, animate: true);

//}
class Chart extends StatelessWidget {
  final List<MyRow> data;

  Chart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MyRow, DateTime>> series = [
      charts.Series(
        id: "Headcount",
        data: data,
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
      )
    ];

//    return charts.TimeSeriesChart(series,
//        // included.
//        primaryMeasureAxis: new charts.NumericAxisSpec(
//            tickProviderSpec:
//            new charts.BasicNumericTickProviderSpec(zeroBound: false)));

    return new charts.TimeSeriesChart(series,
        animate: false,
        // Sets up a currency formatter for the measure axis.
        primaryMeasureAxis: new charts.NumericAxisSpec(),
//            tickFormatterSpec:
//                charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//                    new NumberFormat.compactSimpleCurrency())),

        /// Customizes the date tick formatter. It will print the day of month
        /// as the default format, but include the month and year if it
        /// transitions to a new month.
        ///
        /// minute, hour, day, month, and year are all provided by default and
        /// you can override them following this pattern.
        domainAxis: new charts.DateTimeAxisSpec(
            tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                day: new charts.TimeFormatterSpec(
                    format: 'h', transitionFormat: 'MM/dd/yyyy HH:mm'))));
  }
}
