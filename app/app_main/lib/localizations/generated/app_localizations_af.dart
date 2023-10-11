import 'app_localizations.dart';

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appName => 'Weer';

  @override
  String get titleError => 'Fout';

  @override
  String get titleSunrise => 'Sonopkoms';

  @override
  String get titleSunset => 'Sonsondergang';

  @override
  String get titleTempMax => 'Maksimum Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
