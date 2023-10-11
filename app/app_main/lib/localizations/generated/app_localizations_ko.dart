import 'app_localizations.dart';

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '날씨';

  @override
  String get titleError => '오류';

  @override
  String get titleSunrise => '해돋이';

  @override
  String get titleSunset => '일몰';

  @override
  String get titleTempMax => '최대 온도';

  @override
  String get titleTempMin => '최소온도';
}
