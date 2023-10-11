import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Clima';

  @override
  String get titleError => 'Erro';

  @override
  String get titleSunrise => 'Nascer do sol';

  @override
  String get titleSunset => 'Pôr do sol';

  @override
  String get titleTempMax => 'Temperatura máxima';

  @override
  String get titleTempMin => 'Temperatura mínima';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get appName => 'Clima';

  @override
  String get titleError => 'Erro';

  @override
  String get titleSunrise => 'Nascer do sol';

  @override
  String get titleSunset => 'Pôr do sol';

  @override
  String get titleTempMax => 'Temperatura máxima';

  @override
  String get titleTempMin => 'Temperatura mínima';
}
