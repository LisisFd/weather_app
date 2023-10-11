import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Clima';

  @override
  String get titleError => 'Error';

  @override
  String get titleSunrise => 'Amanecer';

  @override
  String get titleSunset => 'Atardecer';

  @override
  String get titleTempMax => 'Temperatura máxima';

  @override
  String get titleTempMin => 'Temperatura mínima';
}
