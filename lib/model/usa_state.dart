class StateInfo {
  final String name;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int active;
  final int tests;
  final int testsPerOneMillion;

  StateInfo(
      {this.name,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.active,
      this.tests,
      this.testsPerOneMillion});

  factory StateInfo.fromJson(Map<String, dynamic> json) {
    return StateInfo(
        name: json['state'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        active: json['active'],
        tests: json['tests'],
        testsPerOneMillion: json['testsPerOneMillion']);
  }
}
