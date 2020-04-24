import 'package:covidinfo/usa_tab/item_list_builder/state_builder.dart';
import 'package:covidinfo/model/usa_state.dart';
import 'package:covidinfo/networking/network_call.dart';
import 'package:flutter/material.dart';

class CountryTab extends StatefulWidget {
  CountryTab({Key key}) : super(key: key);

  @override
  State createState() => CountryState();
}

class CountryState extends State<CountryTab> {
  Future<List<StateInfo>> futrueContinents;
  List<StateInfo> stateListFromAppBarFetch = List();

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
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.sort_by_alpha),
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'todayCases',
                child: Text("Sort by Today Cases"),
              ),
              PopupMenuItem<String>(
                value: "deaths",
                child: Text("Sort by Death number"),
              ),
              PopupMenuItem<String>(
                value: 'todayDeaths',
                child: Text("Sort by Today Death"),
              ),
            ],
            onSelected: (action) {
              _updateListFromAppbar(action);
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<StateInfo>>(
          future: futrueContinents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildStateInfoList(snapshot.data);
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

  Widget _buildStateInfoList(List<StateInfo> list) {
    //TODO add detail page for click on each card
    var shouldShowList;
    if (stateListFromAppBarFetch.isEmpty) {
      shouldShowList = list;
    } else {
      shouldShowList = stateListFromAppBarFetch;
    }
    return ListView.builder(
      itemCount: shouldShowList.length,
      itemBuilder: (BuildContext context, int index) {
        return StateBuilder().buildItem(context, shouldShowList[index]);
      },
    );
  }

  _updateListFromAppbar(String sortByOrder) {
    fetchUSInforSortBy(sortByOrder).then((states) {
      setState(() {
        stateListFromAppBarFetch.clear();
        stateListFromAppBarFetch.addAll(states);
      });
    });
  }
}
