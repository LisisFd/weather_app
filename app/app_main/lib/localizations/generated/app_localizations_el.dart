import 'app_localizations.dart';

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Καιρός';

  @override
  String get titleError => 'Λάθος';

  @override
  String get titleSunrise => 'Ανατολή ηλίου';

  @override
  String get titleSunset => 'Η δυση του ηλιου';

  @override
  String get titleTempMax => 'Μέγιστη Θερμ';

  @override
  String get titleTempMin => 'Ελάχιστη Θερμ';
}
