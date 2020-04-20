class Continent {
  final int updateTime;
  final int totalCases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recoveredCases;
  final int activeCases;
  final int criticalCases;
  final String name;

  Continent(
      {this.updateTime,
      this.totalCases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recoveredCases,
      this.activeCases,
      this.criticalCases,
      this.name});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      updateTime: json['updated'],
      totalCases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recoveredCases: json['recovered'],
      activeCases: json['active'],
      criticalCases: json['critical'],
      name: json['continent'],
    );
  }
}
