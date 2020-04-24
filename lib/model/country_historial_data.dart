class HistoricalCases {
  final List<String> dates;
  final List<int> cases;

  HistoricalCases({this.dates, this.cases});

  factory HistoricalCases.fromJson(Map<String, dynamic> json) {
    List<String> dateKeys = List();
    json.keys.forEach((String key) {
      dateKeys.add(key);
    });

    List<int> cases = List();

    for (int i = 0; i < dateKeys.length; i++) {
      cases.add(json[dateKeys[i]]);
    }

    return HistoricalCases(dates: dateKeys, cases: cases);
  }
}

class TimeLine {
  final HistoricalCases historicalCases;
  final HistoricalCases deathCases;
  final HistoricalCases recoveredCase;

  TimeLine({this.historicalCases, this.deathCases, this.recoveredCase});

  factory TimeLine.fromJson(Map<String, dynamic> json) {
    return TimeLine(
        historicalCases: HistoricalCases.fromJson(json['cases']),
        deathCases: HistoricalCases.fromJson(json['deaths']),
        recoveredCase: HistoricalCases.fromJson(json['recovered']));
  }
}

class CountryHistoricalData {
  final String name;
  final TimeLine timeLine;

  CountryHistoricalData({this.name, this.timeLine});

  factory CountryHistoricalData.fromJson(Map<String, dynamic> json) {
    return CountryHistoricalData(
        name: json['country'], timeLine: TimeLine.fromJson(json['timeline']));
  }
}
