import 'app_localizations.dart';

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Cuaca';

  @override
  String get titleError => 'Kesalahan';

  @override
  String get titleSunrise => 'Matahari terbit';

  @override
  String get titleSunset => 'Matahari terbenam';

  @override
  String get titleTempMax => 'Suhu Maks';

  @override
  String get titleTempMin => 'Suhu Min';
}
