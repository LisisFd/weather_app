import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => '天気';

  @override
  String get titleError => 'エラー';

  @override
  String get titleSunrise => '日の出';

  @override
  String get titleSunset => '日没';

  @override
  String get titleTempMax => '最高温度';

  @override
  String get titleTempMin => '最低温度';
}
