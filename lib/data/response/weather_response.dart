import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class ForecastResponse {
  List<WeatherResponse> weather;
  MainResponse main;

  ForecastResponse({this.weather, this.main});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

@JsonSerializable()
class WeatherResponse {
  String main;
  String description;

  WeatherResponse({this.main, this.description});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class MainResponse {
  double temp;
  @JsonKey(name: 'feels_like')
  double feelsLike;

  MainResponse({this.temp, this.feelsLike});

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}
