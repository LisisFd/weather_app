import 'app_localizations.dart';

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'מזג אוויר';

  @override
  String get titleError => 'שְׁגִיאָה';

  @override
  String get titleSunrise => 'זריחה';

  @override
  String get titleSunset => 'שקיעת החמה';

  @override
  String get titleTempMax => 'טמפ&#39; מקסימלית';

  @override
  String get titleTempMin => 'טמפ&#39; מינימלית';
}
