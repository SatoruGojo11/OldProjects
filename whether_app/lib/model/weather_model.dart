class Weather {
  final String cityname;
  final String mainCondition;
  final double temperature;

  Weather({
    required this.cityname,
    required this.mainCondition,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityname: json['name'],
      mainCondition: json['weather'][0]['main'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
