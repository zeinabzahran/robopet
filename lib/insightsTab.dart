import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:intl/intl.dart' as intl;

class InsightsTab extends StatefulWidget {
  @override
  _InsightsTabState createState() => _InsightsTabState();
}

class _InsightsTabState extends State<InsightsTab> {
  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: widget,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.4),
      body: StaggeredGridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child:   sample11(context),
          // child: Container(color: Colors.red,)
        ),

        Padding(
          padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white60,)
        ),
        Padding(
          padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white54,)
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: sample11(context),
        ),
        Padding(
            padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white54,)
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(4, 350.0),
        StaggeredTile.extent(2, 250.0),
        StaggeredTile.extent(2, 250.0),
        StaggeredTile.extent(4, 350.0),
        StaggeredTile.extent(4, 80.0),

      ],
    ),
    );
  }
}
Widget sample11(BuildContext context) {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));
  return Center(
    child: Container(
      // color: Color(0xFF7ad6fb).withOpacity(.7),
      child: BezierChart(
        fromDate: fromDate,
        bezierChartScale: BezierChartScale.WEEKLY,
        toDate: toDate,
        onIndicatorVisible: (val) {
          print("Indicator Visible :$val");
        },
        onDateTimeSelected: (datetime) {
          print("selected datetime: $datetime");
        },
        selectedDate: toDate,
        //this is optional
        footerDateTimeBuilder: (DateTime value, BezierChartScale scaleType) {
          final newFormat = intl.DateFormat('dd/MMM');
          return newFormat.format(value);
        },
        bubbleLabelDateTimeBuilder:
            (DateTime value, BezierChartScale scaleType) {
          final newFormat = intl.DateFormat('EEE d');
          return "${newFormat.format(value)}\n";
        },
        series: [
          BezierLine(
            lineColor: Color(0xFF7ad6fb),
            label: "Duty",
            onMissingValue: (dateTime) {
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: [
              DataPoint<DateTime>(value: 30, xAxis: fromDate),
              DataPoint<DateTime>(value: 20, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          showVerticalIndicator: true,
          xAxisTextStyle: TextStyle(color: Color(0xFF7ad6fb)),
          yAxisTextStyle: TextStyle(color: Color(0xFF7ad6fb)),
          backgroundColor: Colors.white70,
          verticalIndicatorFixedPosition: false,
          bubbleIndicatorLabelStyle: TextStyle(
            color: Colors.blue,
          ),
          displayYAxis: true,
          stepsYAxis: 10,
          footerHeight: 35.0,
        ),
      ),
    ),
  );
}

Widget sample1(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Center(
          child: Card(
            elevation: 10,
            child: Container(
              height: MediaQuery.of(context).size.height*.35,
              width: MediaQuery.of(context).size.width,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                selectedValue: 30,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                footerValueBuilder: (double value) {
                  return "${formatAsIntOrDouble(value)}\ndays";
                },
                series: const [
                  BezierLine(
                    label: "m",
                    data: const [
                      DataPoint<double>(value: 10, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 50, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 0, xAxis: 25),
                      DataPoint<double>(value: 5, xAxis: 30),
                      DataPoint<double>(value: 45, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  startYAxisFromNonZeroValue: false,
                  bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                  footerHeight: 40,
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.blue,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  displayYAxis: true,
                  stepsYAxis: 10,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Color(0xFF7ad6fb).withOpacity(.3),
                      Color(0xFF7ad6fb).withOpacity(.5),
                      Color(0xFF7ad6fb).withOpacity(.7),
                      Color(0xFF7ad6fb).withOpacity(.9),
                      Color(0xFF7ad6fb),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  snap: true,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
