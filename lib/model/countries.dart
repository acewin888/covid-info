class Country {
  final int updateTime;
  final String name;
  final CountryInfo countryInfo;
  final int totalCases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recoveredCases;
  final int activeCases;
  final int criticalCases;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;

  Country(
      {this.updateTime,
      this.name,
      this.countryInfo,
      this.totalCases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recoveredCases,
      this.activeCases,
      this.criticalCases,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        updateTime: json['updated'],
        name: json['country'],
        countryInfo: CountryInfo.fromJson(json['countryInfo']),
        totalCases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recoveredCases: json['recovered'],
        activeCases: json['active'],
        criticalCases: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'],
        deathsPerOneMillion: json['deathsPerOneMillion'],
        tests: json['tests'],
        testsPerOneMillion: json['testsPerOneMillion']);
  }
}

class CountryInfo {
  final String flag;

  CountryInfo({this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json['flag']);
  }
}
