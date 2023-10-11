import 'app_localizations.dart';

/// The translations for Latin (`la`).
class AppLocalizationsLa extends AppLocalizations {
  AppLocalizationsLa([String locale = 'la']) : super(locale);

  @override
  String get appName => 'Tempestas';

  @override
  String get titleError => 'Error';

  @override
  String get titleSunrise => 'Ortus';

  @override
  String get titleSunset => 'Solis occasu';

  @override
  String get titleTempMax => 'Max Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
