import 'app_localizations.dart';

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'Vrijeme';

  @override
  String get titleError => 'Greška';

  @override
  String get titleSunrise => 'Izlazak sunca';

  @override
  String get titleSunset => 'Zalazak sunca';

  @override
  String get titleTempMax => 'maks. temp';

  @override
  String get titleTempMin => 'min temp';
}
