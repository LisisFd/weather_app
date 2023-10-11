import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '天气';

  @override
  String get titleError => '错误';

  @override
  String get titleSunrise => '日出';

  @override
  String get titleSunset => '日落';

  @override
  String get titleTempMax => '最高温度';

  @override
  String get titleTempMin => '最低温度';
}
