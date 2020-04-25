import 'package:covidinfo/chart/model/DeathPerDay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/country_historial_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FullScreenChart extends StatefulWidget {
  FullScreenChart({this.cases, this.title}) : super();
  final HistoricalCases cases;
  final String title;

  @override
  State<StatefulWidget> createState() => _FullScreenChartState( newTile: title, cases: cases);
}
class _FullScreenChartState extends State {
  _FullScreenChartState({this.newTile, this.cases});
  final String newTile;
  final HistoricalCases cases;
  var deaths = new List<DeathPerDay>();

  var currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      currentIndex++;
      deaths.removeAt(0);
      deaths.add(DeathPerDay(cases.cases[currentIndex],cases.dates[currentIndex], charts.MaterialPalette.cyan.shadeDefault));
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 5; i++) {
      deaths.add(DeathPerDay(cases.cases[i],cases.dates[i], charts.MaterialPalette.red.shadeDefault));
      currentIndex = i;
    }
    var series = [
      charts.Series(
          domainFn: (DeathPerDay cases, _) => cases.dates,
          measureFn: (DeathPerDay cases, _) => cases.day,
          colorFn: (DeathPerDay cases, _) => cases.color,
          id: 'Deaths',
          data: deaths
      )
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: AspectRatio(
        aspectRatio: 1/1.5,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(newTile)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Graphical Stats:'),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
