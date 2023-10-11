import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Wetter';

  @override
  String get titleError => 'Fehler';

  @override
  String get titleSunrise => 'Sonnenaufgang';

  @override
  String get titleSunset => 'Sonnenuntergang';

  @override
  String get titleTempMax => 'Max. Temp';

  @override
  String get titleTempMin => 'Min. Temp';
}
