import 'app_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Weer';

  @override
  String get titleError => 'Fout';

  @override
  String get titleSunrise => 'zonsopkomst';

  @override
  String get titleSunset => 'Zonsondergang';

  @override
  String get titleTempMax => 'Maximale temperatuur';

  @override
  String get titleTempMin => 'Min. temperatuur';
}
