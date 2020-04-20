import 'dart:convert';

import 'package:covidinfo/model/countries.dart';
import 'package:covidinfo/search_tab/item_list_builder/country_builder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchTab extends StatefulWidget {
  @override
  State createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  Future<List<Country>> futureCountries;

  final TextEditingController _filter = new TextEditingController();
  final List<Country> countries = List();
  String searchText = '';
  List<Country> filterCountries = List();

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search cases by country');

  SearchTabState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          searchText = "";
          filterCountries = countries;
        });
      } else {
        setState(() {
          searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    futureCountries = _fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO is it a good idea to pass app bar in the constructor
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Country>>(
          future: futureCountries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildCountryList(snapshot.data);
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

  Widget _buildCountryList(List<Country> countries) {
    if (searchText.isNotEmpty) {
      List<Country> tempList = List();
      for (int i = 0; i < filterCountries.length; i++) {
        if (filterCountries[i]
            .name
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          tempList.add(filterCountries[i]);
        }
      }
      filterCountries = tempList;
    }

    return ListView.builder(
      itemCount: filterCountries.length,
      itemBuilder: (BuildContext context, int index) {
        return CountryBuilder().buildItem(context, filterCountries[index]);
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search cases by country');
        filterCountries = countries;
        _filter.clear();
      }
    });
  }

  //TODO how to refactor this
  //TODO handle network failure case
  Future<List<Country>> _fetchCountries() async {
    final response = await http.get(
        'https://corona.lmao.ninja/v2/countries?yesterday=true&sort=cases');

    List<Country> apiList = List();

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body);
      List<Country> tempList =
          l.map((dynamic model) => Country.fromJson(model)).toList();
      apiList.addAll(countries);
      setState(() {
        countries.clear();
        countries.addAll(tempList);
        filterCountries = tempList;
      });

      return countries;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
