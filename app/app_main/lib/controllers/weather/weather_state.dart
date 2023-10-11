part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> fiveDays;
  const WeatherSuccess(this.weather, this.fiveDays);
  @override
  List<Object?> get props => [weather];
}
