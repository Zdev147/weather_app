part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherData;

  WeatherSuccessState(this.weatherData);
}

class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState(this.error);
}

class WeatherNoInternetState extends WeatherState {}
