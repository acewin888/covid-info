class CovidInfo {
  final int totalCase;
  final int death;
  final int recoveredCase;

  CovidInfo({this.totalCase, this.death, this.recoveredCase});

  factory CovidInfo.fromJson(Map<String, dynamic> json) {
    return CovidInfo(
      totalCase: json['cases'],
      death: json['deaths'],
      recoveredCase: json['recovered'],
    );
  }
}