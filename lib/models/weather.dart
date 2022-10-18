class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic json) {
    var jsonData = json['forecast']['forecastday'][0]['day'];
    print(json['location']['localtime']);
    return WeatherModel(
      date: json['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'temp = $temp  minTemp = $minTemp ,max Temp =$maxTemp ';
  }
}
