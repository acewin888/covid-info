import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  State createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  Future<List<Country>> countries;

  @override
  void initState() {
    super.initState();
    countries = fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Country>>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data[0].countryInfo.flag);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
