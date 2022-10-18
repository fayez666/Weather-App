import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

import '../provider/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: const InputDecoration(
                hintText: "Enter a City",
                label: Text("Search"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 30)),
            onSubmitted: (city) async {
              Provider.of<WeatherProvider>(context, listen: false).cityName = city;
              WeatherService service = WeatherService();
              WeatherModel weatherModel =
                  await service.getWeather(cityName: Provider.of<WeatherProvider>(context, listen: false).cityName!);
              service.getWeather(cityName: Provider.of<WeatherProvider>(context, listen: false).cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
