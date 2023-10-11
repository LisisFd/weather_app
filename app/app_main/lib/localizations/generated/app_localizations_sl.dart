import 'app_localizations.dart';

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appName => 'Vreme';

  @override
  String get titleError => 'Napaka';

  @override
  String get titleSunrise => 'sončni vzhod';

  @override
  String get titleSunset => 'Sončni zahod';

  @override
  String get titleTempMax => 'Max Temp';

  @override
  String get titleTempMin => 'Min. temp';
}
