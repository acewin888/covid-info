import 'package:covidinfo/countries_tab/item_list_builder/state_builder.dart';
import 'package:covidinfo/model/usa_state.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
import 'package:flutter/material.dart';

class CountryTab extends StatefulWidget {
  CountryTab({Key key}) : super(key: key);

  @override
  State createState() => CountryState();
}

class CountryState extends State<CountryTab> {
  Future<List<StateInfo>> futrueContinents;

  @override
  void initState() {
    super.initState();
    futrueContinents = fetchUSInfor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
          title: Text("US cases by State"),
          // Set the background color of the App Bar
          backgroundColor: Colors.blueGrey
      ),
      body: Center(
        child: FutureBuilder<List<StateInfo>>(
          future: futrueContinents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  CustomViewList<StateInfo>(snapshot.data, StateInfoBuilder()),
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