import 'app_localizations.dart';

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appName => 'Времето';

  @override
  String get titleError => 'Грешка';

  @override
  String get titleSunrise => 'Изгрејсонце';

  @override
  String get titleSunset => 'Зајдисонце';

  @override
  String get titleTempMax => 'Максимална температура';

  @override
  String get titleTempMin => 'Минимална температура';
}
