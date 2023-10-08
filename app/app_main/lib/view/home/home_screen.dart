import 'dart:ui';

import 'package:app_main/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

///TODO: add localize, local provider.Theme provider. Setup repo. Weather view, second screen scroll
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _backgroundElemSize = 300.0;
  static const _blurSigma = 100.0;

  List<Widget> _backgroundBlur() {
    return [
      Align(
        alignment: const AlignmentDirectional(3, -0.3),
        child: Container(
          width: _backgroundElemSize,
          height: _backgroundElemSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-3, -0.3),
        child: Container(
          width: _backgroundElemSize,
          height: _backgroundElemSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          width: _backgroundElemSize * 2,
          height: _backgroundElemSize,
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: const ColoredBox(
          color: Colors.transparent,
        ),
      ),
    ];
  }

  Widget _bodyElemWidget(
      {required BuildContext context,
      required Widget image,
      required String title,
      required String subtitle}) {
    final theme = Theme.of(context);
    return Row(
      children: [
        image,
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.labelMedium,
            ),
            Text(
              subtitle,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }

  Widget _successState(BuildContext context, WeatherSuccess state) {
    final theme = Theme.of(context);
    final Weather weather = state.weather;
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📍${weather.areaName}',
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Good Morning',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/sunny.png',
              scale: 1.2,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              '${weather.temperature?.celsius?.round()}°C',
              style: theme.textTheme.titleLarge,
            ),
          ),
          Center(
            child: Text(
              weather.weatherMain?.toUpperCase() ?? 'null',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              DateFormat('EEEE dd · ')
                  .add_jm()
                  .format(weather.date ?? DateTime.now()),
              style: theme.textTheme.labelLarge,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bodyElemWidget(
                context: context,
                image: Image.asset(
                  'assets/images/sun.png',
                  scale: 5,
                ),
                title: 'Sunrise',
                subtitle: DateFormat()
                    .add_jm()
                    .format(weather.sunrise ?? DateTime.now()),
              ),
              _bodyElemWidget(
                context: context,
                image: Image.asset(
                  'assets/images/night.png',
                  scale: 5.5,
                ),
                title: 'Sunset',
                subtitle: DateFormat()
                    .add_jm()
                    .format(weather.sunset ?? DateTime.now()),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bodyElemWidget(
                context: context,
                image: Image.asset(
                  'assets/images/max_temp.png',
                  scale: 5.8,
                ),
                title: 'Max Temp',
                subtitle: '${weather.tempMax?.celsius?.round()}°C',
              ),
              _bodyElemWidget(
                context: context,
                image: Image.asset(
                  'assets/images/min_temp.png',
                  scale: 5.5,
                ),
                title: 'Min Temp',
                subtitle: '${weather.tempMin?.celsius?.round()}°C',
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> backgroundBlur = _backgroundBlur();
    final Widget frontData = BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return _successState(context, state);
        } else if (state is WeatherFailure) {
          return Center(
              child: Text(
            'Error :(',
            style: theme.textTheme.titleLarge
                ?.copyWith(color: theme.colorScheme.error),
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          child: Stack(
            children: [
              ...backgroundBlur,
              frontData,
            ],
          ),
        ),
      ),
    );
  }
}
