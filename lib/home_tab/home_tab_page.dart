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
  List<Continent> continentList = List();
  var shouldShowLoading = false;

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
              icon: Icon(Icons.refresh),
              onPressed: () {
                // TODO refresh
                setState(() {
                  shouldShowLoading = true;
                  _refreshAPICall();
                });
                //
              }),
        ],

      ),
      body: Center(
        child: FutureBuilder<List<Continent>>(
          future: futrueContinents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (shouldShowLoading) {
                return CircularProgressIndicator();
              }

              var shouldShowList;
              if(continentList.isEmpty){
                shouldShowList = snapshot.data;
              }else{
                shouldShowList = continentList;
              }
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  CustomViewList<Continent>(shouldShowList, ContinentBuilder()),
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

  _refreshAPICall() {
    fetchContinents().then((continents) {
      setState(() {
        shouldShowLoading = false;
        continentList.clear();
        continentList.addAll(continents);
      });
    });
  }
}
