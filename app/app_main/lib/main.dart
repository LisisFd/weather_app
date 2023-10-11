import 'package:app_main/controllers/controllers.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/localizations/generated/app_localizations.dart';
import 'package:app_main/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/config.dart';
import 'view/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ITheme theme = DarkTheme();
    return MaterialApp(
        onGenerateTitle: (context) => context.localization().appName,
        theme: theme.getTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('da'),
          Locale('af'),
          Locale('ar'),
          Locale('az'),
          Locale('bg'),
          Locale('ca'),
          Locale('cs'),
          Locale('da'),
          Locale('de'),
          Locale('el'),
          Locale('en'),
          Locale('es'),
          Locale('eu'),
          Locale('fa'),
          Locale('fi'),
          Locale('fr'),
          Locale('gl'),
          Locale('he'),
          Locale('hi'),
          Locale('hr'),
          Locale('hu'),
          Locale('id'),
          Locale('it'),
          Locale('ja'),
          Locale('ko'),
          Locale('la'),
          Locale('lt'),
          Locale('mk'),
          Locale('nl'),
          Locale('no'),
          Locale('pl'),
          Locale('pt'),
          Locale('ro'),
          Locale('ru'),
          Locale('sk'),
          Locale('sl'),
          Locale('sr'),
          Locale('sv'),
          Locale('th'),
          Locale('tr'),
          Locale('uk'),
          Locale('vi'),
          Locale('zh'),
          Locale('zu'),
        ],
        home: BlocProvider(
          create: (context) {
            return WeatherBloc();
          },
          child: const LocaleListenerWidget(child: HomeScreen()),
        ));
  }
}
