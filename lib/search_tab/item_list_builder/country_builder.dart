import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/util/utils.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/material.dart';

class CountryBuilder extends CustomBuilder<Country> {
  @override
  Widget buildItem(BuildContext context, Country item) {
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    return Card(
      color: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(1.0),
            },
            children: [
              TableRow(
                children: [
                  Text('Total cases:', style: boldStyle),
                  Text(
                    formatNumber(item.totalCases),
                    style: localTheme.body1,
                  ),
                ],
              ),
              TableRow(children: [
                Text('Today Cases:', style: boldStyle),
                Text(
                  formatNumber(item.todayCases),
                  style: localTheme.body1,
                ),
              ]),
              TableRow(
                children: [
                  Text('Total Deaths:', style: boldStyle),
                  Text(
                    formatNumber(item.deaths),
                    style: localTheme.body1,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Recovered:', style: boldStyle),
                  Text(
                    formatNumber(item.recoveredCases),
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
                    formatNumber(item.activeCases),
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
                    formatNumber(item.criticalCases),
                    style: localTheme.body1,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
