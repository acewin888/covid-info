import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:covidinfo/search_tab/item_list_builder/country_builder.dart';
import 'package:covidinfo/widgets/dynamic_list.dart';
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
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  CustomViewList<Country>(snapshot.data, CountryBuilder()),
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
