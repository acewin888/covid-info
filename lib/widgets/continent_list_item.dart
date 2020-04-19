import 'package:covidinfo/model/continents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_formatter/time_formatter.dart';

class ContinentViewList extends StatelessWidget {
  final List<Continent> continentInfo;

  ContinentViewList(this.continentInfo);

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];

    for (int i = 0; i < continentInfo.length; i++) {
      widgets.addAll([
        const SizedBox(height: 4.0),
        ContinentItem(continentInfo[i]),
        const SizedBox(height: 24.0),
      ]);
    }

    widgets.removeLast();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

class ContinentItem extends StatelessWidget {
  final Continent continent;

  ContinentItem(this.continent);

  @override
  Widget build(BuildContext context) {
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    if (continent == null) return Text('NULL', style: localTheme.body1);

    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(1.0),
      },
      children: [
        TableRow(
          children: [
            Text(
              'Update Time:',
              style: boldStyle,
            ),
            Text(
              formatTime(continent.updateTime),
              style: localTheme.body1,
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text('Continent:', style: boldStyle),
            ),
            Text(
              continent.name?.toString() ?? 'NULL',
              style: localTheme.body1,
            ),
          ],
        ),
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
    );
  }
}

String formatNumber(int number){
  return NumberFormat('#,##0', 'en_us').format(number);
}
