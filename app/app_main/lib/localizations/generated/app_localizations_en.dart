import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Weather';

  @override
  String get titleError => 'Error';

  @override
  String get titleSunrise => 'Sunrise';

  @override
  String get titleSunset => 'Sunset';

  @override
  String get titleTempMax => 'Max Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
