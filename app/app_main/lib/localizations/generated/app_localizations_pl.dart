import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Pogoda';

  @override
  String get titleError => 'Błąd';

  @override
  String get titleSunrise => 'wschód słońca';

  @override
  String get titleSunset => 'Zachód słońca';

  @override
  String get titleTempMax => 'Maksymalna temperatura';

  @override
  String get titleTempMin => 'Minimalna temperatura';
}
