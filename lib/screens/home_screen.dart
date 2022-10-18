import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/search_screen.dart';

import '../provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
          )
        ],
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).weatherData ==
              null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.cityName ?? "",
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(provider.weatherData!.date),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/clear.png'),
                    Text(
                     "${provider.weatherData!.temp.toInt()}",
                      style:
                         const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text("maxTemp : ${provider.weatherData!.maxTemp.toInt()}"),
                        Text("minTemp : ${provider.weatherData!.minTemp.toInt()}"),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  provider.weatherData!.weatherStateName,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                ),
              ],
            ),
    );
  }
}
