import 'package:covidinfo/model/continents.dart';
import 'package:covidinfo/util/utils.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';

class ContinentBuilder extends CustomBuilder<Continent> {
  @override
  Widget buildItem(BuildContext context, Continent continent) {
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    if (continent == null) return Text('NULL', style: localTheme.body1);

    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            continent.name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Updated " + formatTime(continent.updateTime),
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          Card(
            color: Colors.blueGrey,
            child: Table(
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(1.0),
              },
              children: [
                TableRow(
                  children: [
                    Text('Total cases:', style: boldStyle),
                    Text(
                      formatNumber(continent.totalCases),
                      style: localTheme.body1,
                    ),
                  ],
                ),
                TableRow(children: [
                  Text('Today Cases:', style: boldStyle),
                  Text(
                    formatNumber(continent.todayCases),
                    style: localTheme.body1,
                  ),
                ]),
                TableRow(
                  children: [
                    Text('Total Deaths:', style: boldStyle),
                    Text(
                      formatNumber(continent.deaths),
                      style: localTheme.body1,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Recovered:', style: boldStyle),
                    Text(
                      formatNumber(continent.recoveredCases),
                      style: localTheme.body1,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('Active Cases:', style: boldStyle),
                    ),
                    Text(
                      formatNumber(continent.activeCases),
                      style: localTheme.body1,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('Critial cases:', style: boldStyle),
                    ),
                    Text(
                      formatNumber(continent.criticalCases),
                      style: localTheme.body1,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}