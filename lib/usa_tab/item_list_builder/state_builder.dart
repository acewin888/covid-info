import 'package:covidinfo/detail_screen/detail_page.dart';
import 'package:covidinfo/model/usa_state.dart';
import 'package:covidinfo/util/utils.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/material.dart';

class StateBuilder extends CustomBuilder<StateInfo> {
  @override
  Widget buildItem(BuildContext context, StateInfo item) {
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
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
                        Text('State name:', style: boldStyle),
                        Text(
                          item.name,
                          style: boldStyle,
                        ),
                      ],
                    ),
                    TableRow(children: [
                      Text('Total cases:', style: boldStyle),
                      Text(
                        formatNumber(item.cases),
                        style: localTheme.body1,
                      ),
                    ]),
                    TableRow(
                      children: [
                        Text('Today case:', style: boldStyle),
                        Text(
                          formatNumber(item.todayCases),
                          style: localTheme.body1,
                        ),
                      ],
                    ),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('Today Deaths:', style: boldStyle),
                        ),
                        Text(
                          formatNumber(item.todayDeaths),
                          style: localTheme.body1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('Total Tests done:', style: boldStyle),
                        ),
                        Text(
                          formatNumber(item.tests),
                          style: localTheme.body1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text('Test per On Million Population:',
                              style: boldStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            formatNumber(item.testsPerOneMillion),
                            style: localTheme.body1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
