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
  final WeatherView weather;
  final List<WeatherView> fiveDays;
  const WeatherSuccess(this.weather, this.fiveDays);
  @override
  List<Object?> get props => [weather];
}
