import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class MainWeatherWidget extends StatelessWidget {
  final Weather weather;
  const MainWeatherWidget({super.key, required this.weather});
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
    );
  }
}
