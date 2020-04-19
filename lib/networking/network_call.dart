import 'dart:convert';

import 'package:covidinfo/model/continents.dart';
import 'package:covidinfo/model/countries.dart';
import 'package:http/http.dart' as http;

Future<List<Continent>> fetchContinents() async {
  final response = await http
      .get('https://corona.lmao.ninja/v2/continents?yesterday=true&sort=cases');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable l = json.decode(response.body);
    List<Continent> continents =
    l.map((dynamic model) => Continent.fromJson(model)).toList();
    return continents;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
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