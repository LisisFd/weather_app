import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Погода';

  @override
  String get titleError => 'Ошибка';

  @override
  String get titleSunrise => 'Восход';

  @override
  String get titleSunset => 'Закат';

  @override
  String get titleTempMax => 'Макс. температура';

  @override
  String get titleTempMin => 'Минимальная температура';
}
