class WeatherModel {
  final double lat;
  final double lon;
  final List<Daily> daily;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: double.parse('${json["lat"] ?? 0}'),
        lon: double.parse('${json["lon"] ?? 0}'),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class Daily {
  final DateTime dt;
  final DateTime sunrise;
  final DateTime sunset;
  final double windSpeed;
  final Temp temp;
  final FeelsLike feelsLike;
  final int humidity;
  final double dewPoint;
  final List<Weather> weather;
  final double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.dewPoint,
    required this.weather,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: DateTime.fromMillisecondsSinceEpoch(json["dt"]*1000),
        sunrise: DateTime.fromMillisecondsSinceEpoch(json["sunrise"]*1000),
        sunset:DateTime.fromMillisecondsSinceEpoch(json["sunset"]*1000) ,
        windSpeed: json['wind_speed']?.toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        uvi: json["uvi"]?.toDouble(),
      );
}

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );
}
