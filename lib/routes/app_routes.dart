import 'package:flutter/material.dart';
import 'package:task/presentation/weather/weather_screen.dart';

class AppRoutes {
  static const String weatherScreen = '/weather_screen';

  static Map<String, WidgetBuilder> get routes => {
        weatherScreen: WeatherScreen.builder,
      };
}
