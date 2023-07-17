import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_provider/repositories/weather_repository.dart';
import 'package:open_weather_provider/services/weather_api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() {
    WeatherRepository(
            weatherApiServices: WeatherApiServices(httpClient: http.Client()))
        .fetchWeather('london');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(child: Text('Home')),
    );
  }
}
