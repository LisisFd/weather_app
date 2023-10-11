import 'app_localizations.dart';

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Počasie';

  @override
  String get titleError => 'Chyba';

  @override
  String get titleSunrise => 'svitanie';

  @override
  String get titleSunset => 'Západ slnka';

  @override
  String get titleTempMax => 'Max';

  @override
  String get titleTempMin => 'min.tepl';
}
