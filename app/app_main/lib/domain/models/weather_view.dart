import 'package:weather/weather.dart';

import '../domain.dart';

class WeatherView {
  final WeatherGroup group;
  final Weather weather;

  const WeatherView({
    required this.group,
    required this.weather,
  });
}
