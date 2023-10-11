import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'मौसम';

  @override
  String get titleError => 'गलती';

  @override
  String get titleSunrise => 'सूर्योदय';

  @override
  String get titleSunset => 'सूर्यास्त';

  @override
  String get titleTempMax => 'अधिकतम तापमान';

  @override
  String get titleTempMin => 'न्यूनतम तापमान';
}
