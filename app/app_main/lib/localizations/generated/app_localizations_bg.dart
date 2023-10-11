import 'app_localizations.dart';

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'Метеорологично време';

  @override
  String get titleError => 'Грешка';

  @override
  String get titleSunrise => 'Изгрев';

  @override
  String get titleSunset => 'Залез';

  @override
  String get titleTempMax => 'Макс. темп';

  @override
  String get titleTempMin => 'Мин. темп';
}
