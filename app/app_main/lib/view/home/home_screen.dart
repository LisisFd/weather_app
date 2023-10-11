import 'dart:ui';

import 'package:app_main/controllers/controllers.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

///TODO: add localize, local provider.Theme provider. Setup repo.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const _backgroundElemSize = 300.0;
  static const _blurSigma = 100.0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  double _scale = 1;
  double _opacity = 1;
  bool _scrollStart = false;
  final GlobalKey _fiveDaysKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var size = MediaQuery.of(context).size.height / 2;
      _controller.addListener(() {
        double of = _controller.offset;
        setState(() {
          of = of <= 0 ? 1 : of;
          _scale = (size - of) / size;
          _opacity = (size - of) / size;
          if (_opacity <= 0 || _scale <= 0) {
            _opacity = 0;
            _scale = 0;
          }
        });
      });
    });

    super.initState();
  }

  void _onEndScroll(ScrollMetrics metrics) async {
    if (_scale <= 0) return;
    bool forward =
        _controller.position.userScrollDirection == ScrollDirection.forward;
    setState(() {
      _scrollStart = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BuildContext? currentContext = _fiveDaysKey.currentContext;
      RenderBox renderBox = currentContext?.findRenderObject() as RenderBox;
      double position = 0.0;
      if (!forward) {
        position = renderBox.globalToLocal(Offset.zero).dy * -1;
      }
      await _controller.animateTo(position,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
      setState(() {
        _scrollStart = false;
      });
    });
  }

  Widget _successState(BuildContext context, WeatherSuccess state) {
    final Weather weather = state.weather;
    final List<Weather> fiveDays = state.fiveDays;
    final List<_DateListModel> models = _getWeathers(fiveDays);
    const Widget padding = SizedBox(
      height: 10,
    );
    final List<Widget> daysWidgets = models
        .map(
          (m) => Column(
            children: [
              padding,
              ExpansionTile(
                title: Text(m.title),
                childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                leading: Image.asset(
                  'assets/images/night.png',
                  scale: 6,
                ),
                children: m.weathers.map((w) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/night.png',
                            scale: 8,
                          ),
                          Text(
                            DateFormat('').add_jm().format(
                                  w.date ?? DateTime.now(),
                                ),
                          ),
                          Text('${w.temperature?.celsius?.round()}°C')
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        )
        .toList();

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
          if (!_scrollStart) {
            _onEndScroll(scrollNotification.metrics);
          }
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Opacity(
              opacity: _opacity,
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: _scale,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: MainWeatherWidget(
                    weather: weather,
                  ),
                ),
              ),
            ),
            Column(key: _fiveDaysKey, children: [
              //
              ...daysWidgets,
            ])
          ],
        ),
      ),
    );
  }

  List<_DateListModel> _getWeathers(List<Weather> weathers) {
    DateFormat format = DateFormat('dd EEEE y');
    Map<DateTime, _DateListModel> setUpMap = {};
    for (Weather w in weathers) {
      DateTime? date = w.date;
      if (date == null) continue;
      date = DateTime(date.year, date.month, date.day);
      if (setUpMap.containsKey(date)) {
        _DateListModel? model = setUpMap[date];
        model?.weathers.add(w);
        if (model != null) {
          setUpMap[date] = model;
        }
      } else {
        setUpMap[date] =
            _DateListModel(title: format.format(date), weathers: [w]);
      }
    }
    return setUpMap.values.toList();
  }

  List<Widget> _backgroundBlur() {
    return [
      Align(
        alignment: const AlignmentDirectional(3, -0.3),
        child: Container(
          width: HomeScreen._backgroundElemSize,
          height: HomeScreen._backgroundElemSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-3, -0.3),
        child: Container(
          width: HomeScreen._backgroundElemSize,
          height: HomeScreen._backgroundElemSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          width: HomeScreen._backgroundElemSize * 2,
          height: HomeScreen._backgroundElemSize,
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: HomeScreen._blurSigma, sigmaY: HomeScreen._blurSigma),
        child: const ColoredBox(
          color: Colors.transparent,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = context.localization();
    final List<Widget> backgroundBlur = _backgroundBlur();
    final Widget frontData = BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return _successState(context, state);
        } else if (state is WeatherFailure) {
          return Center(
              child: Text(
            localization.titleError,
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
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        child: Stack(
          children: [
            ...backgroundBlur,
            frontData,
          ],
        ),
      ),
    );
  }
}

final class _DateListModel {
  final String title;
  final List<Weather> weathers;

  _DateListModel({required this.title, this.weathers = const []});
}
