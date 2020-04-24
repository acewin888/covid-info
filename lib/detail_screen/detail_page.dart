import 'package:covidinfo/example/chat_page.dart';
import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/model/country_historial_data.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:covidinfo/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryDetailScreen extends StatefulWidget {
  CountryDetailScreen({Key key, this.title, this.countryInfo})
      : super(key: key);

  final String title;
  final Country countryInfo;

  @override
  _CountryDetailState createState() => _CountryDetailState(countryInfo);
}

class _CountryDetailState extends State<CountryDetailScreen> {
  final Country country;

  Future<CountryHistoricalData> historyData;

  _CountryDetailState(this.country);

  @override
  void initState() {
    super.initState();
    historyData = fetchCountryHistoricalData(country.name);
  }

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];

  List<CircularStackEntry> circularData = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  Material myTextItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myCircularItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnimatedCircularChart(
                      size: const Size(100.0, 100.0),
                      initialChartData: circularData,
                      chartType: CircularChartType.Pie,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart1Items(
      String title, String priceVal, String subtitle, List<int> listToRender) {
    return Material(
        color: Colors.white,
        elevation: 14.0,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Color(0x802196F3),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GrowthChartPage(),
              ),
            );
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          priceVal,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: new Sparkline(
                          data: convertListofIntToListOfDouble(listToRender),
                          lineColor: Color(0xffff6101),
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Material mychart2Items(String title, String priceVal, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data1,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber[800], Colors.amber[200]],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              //
            }),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.chartLine),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Center(
          child: FutureBuilder<CountryHistoricalData>(
        future: historyData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Total Cases",
                      formatNumber(country.totalCases).toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems(
                      "Total Death", formatNumber(country.deaths).toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextItems("Test Per One Million",
                      formatNumber(country.testsPerOneMillion).toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mychart1Items("", "Increasing cases last 30 days", "",
                      snapshot.data.timeLine.historicalCases.cases),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mychart1Items("", "Recovered cases ", "",
                      snapshot.data.timeLine.recoveredCase.cases),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mychart1Items("", "Death cases ", "",
                      snapshot.data.timeLine.deathCases.cases),
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 120.0),
                StaggeredTile.extent(2, 120.0),
                StaggeredTile.extent(4, 140.0),
                StaggeredTile.extent(4, 250.0),
                StaggeredTile.extent(4, 250.0),
                StaggeredTile.extent(4, 250.0),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}

convertListofIntToListOfDouble(List<int> list) {
  var listDouble = list.map((i) => i.toDouble()).toList();
  return listDouble;
}
