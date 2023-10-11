import 'app_localizations.dart';

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'آب و هوا';

  @override
  String get titleError => 'خطا';

  @override
  String get titleSunrise => 'طلوع خورشید';

  @override
  String get titleSunset => 'غروب آفتاب';

  @override
  String get titleTempMax => 'حداکثر دما';

  @override
  String get titleTempMin => 'حداقل دما';
}
