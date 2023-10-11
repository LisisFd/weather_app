import 'app_localizations.dart';

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Vejr';

  @override
  String get titleError => 'Fejl';

  @override
  String get titleSunrise => 'Solopgang';

  @override
  String get titleSunset => 'Solnedgang';

  @override
  String get titleTempMax => 'Max Temp';

  @override
  String get titleTempMin => 'Min Temp';
}
