class CovidData {
  String? country;
  int? cases;
  int? confirmed;
  int? deaths;
  int? recovered;
  String? updatedAt;

  CovidData({
    this.country,
    this.cases,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.updatedAt,
  });

  CovidData.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'country': country,
      'cases': cases,
      'confirmed': confirmed,
      'deaths': deaths,
      'recovered': recovered,
      'updated_at': updatedAt,
    };
    return data;
  }
}
