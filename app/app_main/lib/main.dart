import 'package:app_main/controllers/controllers.dart';
import 'package:app_main/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ITheme theme = DarkTheme();
    return MaterialApp(
        title: 'Weather App',
        theme: theme.getTheme(),
        home: BlocProvider(
          create: (context) => WeatherBloc()..add(FetchWeather()),
          child: const HomeScreen(),
        ));
  }
}
