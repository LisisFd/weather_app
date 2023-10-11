import 'app_localizations.dart';

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'สภาพอากาศ';

  @override
  String get titleError => 'ข้อผิดพลาด';

  @override
  String get titleSunrise => 'พระอาทิตย์ขึ้น';

  @override
  String get titleSunset => 'พระอาทิตย์ตก';

  @override
  String get titleTempMax => 'อุณหภูมิสูงสุด';

  @override
  String get titleTempMin => 'อุณหภูมิต่ำสุด';
}
