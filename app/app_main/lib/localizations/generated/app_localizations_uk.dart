import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Погода';

  @override
  String get titleError => 'Помилка';

  @override
  String get titleSunrise => 'Схід сонця';

  @override
  String get titleSunset => 'Захід сонця';

  @override
  String get titleTempMax => 'Макс. темп';

  @override
  String get titleTempMin => 'Мін. темп';
}
