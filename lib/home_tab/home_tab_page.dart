import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  State createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  Future<CovidInfo> futureCovid;

  @override
  void initState() {
    super.initState();
    futureCovid = fetchCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<CovidInfo>(
          future: futureCovid,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.totalCase.toString() + "  xuyang");
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

Future<CovidInfo> fetchCovid() async {
  final response =
      await http.get('https://coronavirus-19-api.herokuapp.com/all');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CovidInfo.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class CovidInfo {
  final int totalCase;
  final int death;
  final int recoveredCase;

  CovidInfo({this.totalCase, this.death, this.recoveredCase});

  factory CovidInfo.fromJson(Map<String, dynamic> json) {
    return CovidInfo(
      totalCase: json['cases'],
      death: json['deaths'],
      recoveredCase: json['recovered'],
    );
  }
}
