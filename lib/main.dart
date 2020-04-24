import 'package:covidinfo/usa_tab/countries_tab_page.dart';
import 'package:covidinfo/home_tab/home_tab_page.dart';
import 'package:covidinfo/search_tab/search_tab_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "COVID Info",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  State createState() => HomeState();
}

//TODO convert private field by adding _
class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO wrap tab bar so that it wont block the bottom action line in iphone
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[HomeTab(), CountryTab(), SearchTab()],
        // set the controller
        controller: tabController,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.map),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
          ],
          // setup the controller
          controller: tabController,
        ),
      ),
    );
  }
}
