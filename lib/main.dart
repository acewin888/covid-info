import 'package:covidinfo/countries_tab/countries_tab_page.dart';
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
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[HomeTab(), CountriesTab(), SearchTab()],
        // set the controller
        controller: tabController,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blueGrey,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.add_alert),
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
