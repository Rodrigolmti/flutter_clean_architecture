// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) {
  return ForecastResponse(
    weather: (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    main: json['main'] == null
        ? null
        : MainResponse.fromJson(json['main'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
    };

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    main: json['main'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) {
  return MainResponse(
    temp: (json['temp'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };
