import 'dart:async';

import 'package:covidinfo/home_tab/item_list_builder/continent_builder.dart';
import 'package:covidinfo/model/continents.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  State createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  Future<List<Continent>> futrueContinents;

  @override
  void initState() {
    super.initState();
    futrueContinents = fetchContinents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
          title: Text("Continent Info"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                // TODO refresh
                //
              }),
        ],

      ),
      body: Center(
        child: FutureBuilder<List<Continent>>(
          future: futrueContinents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  CustomViewList<Continent>(snapshot.data, ContinentBuilder()),
                  const SizedBox(height: 16.0),
                ],
              );
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
