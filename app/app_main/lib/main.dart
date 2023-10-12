import 'package:app_main/app_main.dart';
import 'package:app_main/controllers/controllers.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/localizations/generated/app_localizations.dart';
import 'package:app_main/view/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'view/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  static const double _appWidth = 390.0;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget materialApp = BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              onGenerateTitle: (context) => context.localization().appName,
              theme: state.theme.getTheme(),
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
                  return WeatherBloc(dotenv.env['API_KEY'] ?? '');
                },
                child: const LocaleListenerWidget(child: HomeScreen()),
              ));
        },
      ),
    );
    return kIsWeb
        ? FlutterWebFrame(
            builder: (context) {
              var deviceWidth = MediaQuery.of(context).size.width;
              return ResponsiveWrapper.builder(
                Center(child: materialApp),
                defaultScaleFactor: deviceWidth / _appWidth,
              );
            },
            maximumSize: const Size(_appWidth, _appWidth * 2),
          )
        : materialApp;
  }
}
