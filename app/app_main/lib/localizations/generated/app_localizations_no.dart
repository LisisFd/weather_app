import 'app_localizations.dart';

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appName => 'Vær';

  @override
  String get titleError => 'Feil';

  @override
  String get titleSunrise => 'Soloppgang';

  @override
  String get titleSunset => 'Solnedgang';

  @override
  String get titleTempMax => 'Maks temp';

  @override
  String get titleTempMin => 'Min Temp';
}
