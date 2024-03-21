import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScreenTime {
  final String appName;
  final double duration;
  final charts.Color color;

  ScreenTime(this.appName, this.duration, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class ScreenTimeAnalysis extends StatelessWidget {
  final List<ScreenTime> data = [
    ScreenTime('Facebook', 2, Colors.blue),
    ScreenTime('Instagram', 1, Color.fromARGB(255, 224, 85, 180)),
    ScreenTime('X', 1, Colors.black),
    ScreenTime('Snapchat', 0.5, Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ScreenTime, String>> series = [
      charts.Series(
        id: 'ScreenTime',
        domainFn: (ScreenTime screenTime, _) => screenTime.appName,
        measureFn: (ScreenTime screenTime, _) => screenTime.duration,
        colorFn: (ScreenTime screenTime, _) => screenTime.color,
        data: data,
        // Add a label accessor function to get label text from data
        labelAccessorFn: (ScreenTime screenTime, _) =>
            '${screenTime.appName}: ${screenTime.duration} hours',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Screen Time Analysis')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: charts.BarChart(
          series,
          // Configure X-axis (app names)
          domainAxis: charts.OrdinalAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                fontSize: 12, // Adjust label font size
                color: charts.MaterialPalette.black, // X-axis label color
              ),
            ),
          ),
          // Configure Y-axis (duration)
          primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
                fontSize: 12, // Adjust label font size
                color: charts.MaterialPalette.black, // Y-axis label color
              ),
            ),
          ),
          // Custom bar renderer with rounded corners
          defaultRenderer: charts.BarRendererConfig(
            cornerStrategy: const charts.ConstCornerStrategy(30),
          ),
          // Add animation settings
          animate: false, // Animations disabled
          // Add legend
          behaviors: [
            charts.SeriesLegend(
              position: charts.BehaviorPosition.bottom,
              horizontalFirst: false,
              desiredMaxRows: 2, // Maximum number of rows in the legend
              cellPadding: EdgeInsets.all(4.0),
              entryTextStyle: charts.TextStyleSpec(
                color: charts.MaterialPalette.black, // Legend text color
                fontSize: 12, // Adjust legend text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
