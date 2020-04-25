import 'package:covidinfo/chart/model/DeathPerDay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/country_historial_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FullScreenChart extends StatefulWidget {
  FullScreenChart({this.cases, this.title}) : super();

  final HistoricalCases cases;
  final String title;

  List<DeathPerDay> casesOfDeaths() {
    var deaths = new List<DeathPerDay>();

    for (var i = 0; i > cases.cases.length -1 ; i++) {
      deaths.add(DeathPerDay(cases.cases[i],cases.dates[i], charts.Color.black));
    }
    return deaths;
  }
  @override
  State<StatefulWidget> createState() => _FullScreenChartState(data: casesOfDeaths());
}

class _FullScreenChartState extends State {
  _FullScreenChartState({this.data});
  final List<DeathPerDay> data;

  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var series = [
      charts.Series(
      domainFn: (DeathPerDay cases, _) => cases.dates,
      measureFn: (DeathPerDay cases, _) => cases.day,
      colorFn: (DeathPerDay cases, _) => cases.color,
      id: 'Deaths',
      data: this.data
    )
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Rate of deaths')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$counter', style: Theme.of(context).textTheme.display1),
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