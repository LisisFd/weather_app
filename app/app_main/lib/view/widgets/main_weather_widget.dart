import 'package:app_main/domain/domain.dart';
import 'package:app_main/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainWeatherWidget extends StatelessWidget {
  final WeatherView weatherView;
  const MainWeatherWidget({super.key, required this.weatherView});
  Widget _bodyElemWidget(
      {required BuildContext context,
      required Widget image,
      required String title,
      required String subtitle}) {
    final theme = Theme.of(context);
    return Flexible(
      child: Row(
        children: [
          Flexible(child: image),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = context.localization();
    final weather = weatherView.weather;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 1.2 * kToolbarHeight,
        ),
        Text(
          '📍${weather.areaName}',
          style: theme.textTheme.labelMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            weatherView.group.imageUrl,
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
              title: localization.titleSunrise,
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
              title: localization.titleSunset,
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
              title: localization.titleTempMax,
              subtitle: '${weather.tempMax?.celsius?.round()}°C',
            ),
            _bodyElemWidget(
              context: context,
              image: Image.asset(
                'assets/images/min_temp.png',
                scale: 5.5,
              ),
              title: localization.titleTempMin,
              subtitle: '${weather.tempMin?.celsius?.round()}°C',
            ),
          ],
        )
      ],
    );
  }
}
