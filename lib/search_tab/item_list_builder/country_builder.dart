import 'package:covidinfo/detail_screen/detail_page.dart';
import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/util/utils.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CountryBuilder extends CustomBuilder<Country> {
  @override
  Widget buildItem(BuildContext context, Country item) {
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetailScreen(
                title: item.name,
                countryInfo: item,
              ),
            ),
          );
        },
        child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(20.0))),
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FadeInImage.memoryNetwork(
                          alignment: Alignment.centerLeft,
                          width: 60.0,
                          height: 60.0,
                          placeholder: kTransparentImage,
                          image: item.countryInfo.flag),
                    ),
                    Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(1.0),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text('Total Cases:', style: boldStyle),
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
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text('Critical Cases:', style: boldStyle),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                formatNumber(item.criticalCases),
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
            )));
  }
}
