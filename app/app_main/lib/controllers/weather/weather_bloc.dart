import 'package:app_main/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../config/config.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(_fetchWeather);
  }

  void _fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      String code = event.locale.languageCode;
      Language language = _languageCode.entries
          .firstWhere(
            (element) => element.value == code,
            orElse: () => _languageCode.entries.firstWhere(
              (element) => element.key == Language.ENGLISH,
            ),
          )
          .key;
      WeatherFactory weatherFactory =
          WeatherFactory(APIKEY, language: language);

      Position position = await _determinePosition();
      double latitude = position.latitude;
      double longitude = position.longitude;
      Weather weather =
          await weatherFactory.currentWeatherByLocation(latitude, longitude);
      WeatherView weatherView = _convertToView(weather);
      List<Weather> weathers =
          await weatherFactory.fiveDayForecastByLocation(latitude, longitude);
      List<WeatherView> weathersView = [];
      for (var w in weathers) {
        weathersView.add(_convertToView(w));
      }
      emit(WeatherSuccess(weatherView, weathersView));
    } catch (e) {
      emit(WeatherFailure());
    }
  }

  WeatherView _convertToView(Weather weather) {
    WeatherView view = WeatherView(
      group: WeatherGroups.getGroupById(weather.weatherConditionCode ?? 0),
      weather: weather,
    );
    return view;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}

const Map<Language, String> _languageCode = {
  Language.AFRIKAANS: 'af',
  Language.ALBANIAN: 'al',
  Language.ARABIC: 'ar',
  Language.AZERBAIJANI: 'az',
  Language.BULGARIAN: 'bg',
  Language.CATALAN: 'ca',
  Language.CZECH: 'cz',
  Language.DANISH: 'da',
  Language.GERMAN: 'de',
  Language.GREEK: 'el',
  Language.ENGLISH: 'en',
  Language.BASQUE: 'eu',
  Language.PERSIAN: 'fa',
  Language.FARSI: 'fa',
  Language.FINNISH: 'fi',
  Language.FRENCH: 'fr',
  Language.GALICIAN: 'gl',
  Language.HEBREW: 'he',
  Language.HINDI: 'hi',
  Language.CROATIAN: 'hr',
  Language.HUNGARIAN: 'hu',
  Language.INDONESIAN: 'id',
  Language.ITALIAN: 'it',
  Language.JAPANESE: 'ja',
  Language.KOREAN: 'kr',
  Language.LATVIAN: 'la',
  Language.LITHUANIAN: 'lt',
  Language.MACEDONIAN: 'mk',
  Language.NORWEGIAN: 'no',
  Language.DUTCH: 'nl',
  Language.POLISH: 'pl',
  Language.PORTUGUESE: 'pt',
  Language.PORTUGUESE_BRAZIL: 'pt_br',
  Language.ROMANIAN: 'ro',
  Language.RUSSIAN: 'ru',
  Language.SWEDISH: 'sv',
  Language.SLOVAK: 'sk',
  Language.SLOVENIAN: 'sl',
  Language.SPANISH: 'sp',
  Language.SERBIAN: 'sr',
  Language.THAI: 'th',
  Language.TURKISH: 'tr',
  Language.UKRAINIAN: 'ua',
  Language.VIETNAMESE: 'vi',
  Language.CHINESE_SIMPLIFIED: 'zh_cn',
  Language.CHINESE_TRADITIONAL: 'zh_tw',
  Language.ZULU: 'zu',
};
