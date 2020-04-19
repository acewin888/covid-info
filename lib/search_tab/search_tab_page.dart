import 'dart:convert';

import 'package:covidinfo/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
              return Text( snapshot.data[0].countryInfo.flag);
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

Future<List<Country>> fetchCountries() async {
  final response = await http
      .get('https://corona.lmao.ninja/v2/countries?yesterday=true&sort=cases');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    List<Country> continents =
        l.map((dynamic model) => Country.fromJson(model)).toList();
    return continents;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
