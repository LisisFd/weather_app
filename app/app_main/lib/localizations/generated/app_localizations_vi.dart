import 'app_localizations.dart';

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Thời tiết';

  @override
  String get titleError => 'Lỗi';

  @override
  String get titleSunrise => 'bình Minh';

  @override
  String get titleSunset => 'Hoàng hôn';

  @override
  String get titleTempMax => 'Nhiệt độ tối đa';

  @override
  String get titleTempMin => 'Nhiệt độ tối thiểu';
}
