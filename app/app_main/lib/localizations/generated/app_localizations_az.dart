import 'app_localizations.dart';

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appName => 'Hava';

  @override
  String get titleError => 'Xəta';

  @override
  String get titleSunrise => 'Günəşin doğuşu';

  @override
  String get titleSunset => 'Gün batımı';

  @override
  String get titleTempMax => 'Maks Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
