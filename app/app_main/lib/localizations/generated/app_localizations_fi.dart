import 'app_localizations.dart';

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Sää';

  @override
  String get titleError => 'Virhe';

  @override
  String get titleSunrise => 'Auringonnousu';

  @override
  String get titleSunset => 'Auringonlasku';

  @override
  String get titleTempMax => 'Max lämpötila';

  @override
  String get titleTempMin => 'Min Temp';
}
