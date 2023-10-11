import 'app_localizations.dart';

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appName => 'Време';

  @override
  String get titleError => 'Грешка';

  @override
  String get titleSunrise => 'излазак Сунца';

  @override
  String get titleSunset => 'Залазак сунца';

  @override
  String get titleTempMax => 'Мак Темп';

  @override
  String get titleTempMin => 'Мин Темп';
}
