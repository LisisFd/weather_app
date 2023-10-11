import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Hava durumu';

  @override
  String get titleError => 'Hata';

  @override
  String get titleSunrise => 'gündoğumu';

  @override
  String get titleSunset => 'Gün batımı';

  @override
  String get titleTempMax => 'Maksimum Sıcaklık';

  @override
  String get titleTempMin => 'Minimum Sıcaklık';
}
