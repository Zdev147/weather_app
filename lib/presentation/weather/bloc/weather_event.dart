part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final dynamic address;

  GetWeatherEvent(this.address);
}
