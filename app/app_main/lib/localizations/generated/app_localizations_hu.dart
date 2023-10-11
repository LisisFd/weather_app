import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Időjárás';

  @override
  String get titleError => 'Hiba';

  @override
  String get titleSunrise => 'Napkelte';

  @override
  String get titleSunset => 'Napnyugta';

  @override
  String get titleTempMax => 'Max hőm';

  @override
  String get titleTempMin => 'Min. hőmérséklet';
}
