import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'طقس';

  @override
  String get titleError => 'خطأ';

  @override
  String get titleSunrise => 'شروق الشمس';

  @override
  String get titleSunset => 'غروب';

  @override
  String get titleTempMax => 'ماكس درجة الحرارة';

  @override
  String get titleTempMin => 'الحد الأدنى لدرجة الحرارة';
}
