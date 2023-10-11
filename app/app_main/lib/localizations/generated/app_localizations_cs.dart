import 'app_localizations.dart';

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Počasí';

  @override
  String get titleError => 'Chyba';

  @override
  String get titleSunrise => 'svítání';

  @override
  String get titleSunset => 'Západ slunce';

  @override
  String get titleTempMax => 'Max';

  @override
  String get titleTempMin => 'Min';
}
