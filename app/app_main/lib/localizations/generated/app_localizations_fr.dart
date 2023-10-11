import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Météo';

  @override
  String get titleError => 'Erreur';

  @override
  String get titleSunrise => 'Lever du soleil';

  @override
  String get titleSunset => 'Coucher de soleil';

  @override
  String get titleTempMax => 'Température maximale';

  @override
  String get titleTempMin => 'Température minimale';
}
