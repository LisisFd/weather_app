import 'app_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'El temps';

  @override
  String get titleError => 'Error';

  @override
  String get titleSunrise => 'Sortida del sol';

  @override
  String get titleSunset => 'Posta de sol';

  @override
  String get titleTempMax => 'Temp. màxima';

  @override
  String get titleTempMin => 'Temp. mín';
}
