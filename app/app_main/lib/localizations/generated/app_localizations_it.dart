import 'app_localizations.dart';

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Tempo atmosferico';

  @override
  String get titleError => 'Errore';

  @override
  String get titleSunrise => 'Alba';

  @override
  String get titleSunset => 'Tramonto';

  @override
  String get titleTempMax => 'Temp. massima';

  @override
  String get titleTempMin => 'Temp. minima';
}
