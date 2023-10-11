import 'app_localizations.dart';

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Väder';

  @override
  String get titleError => 'Fel';

  @override
  String get titleSunrise => 'Soluppgång';

  @override
  String get titleSunset => 'Solnedgång';

  @override
  String get titleTempMax => 'Max Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
