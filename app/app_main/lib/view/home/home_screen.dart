import 'dart:ui';

import 'package:app_main/controllers/controllers.dart';
import 'package:app_main/domain/domain.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

///TODO: Create workflow create page gitHub
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
    final ThemeData theme = Theme.of(context);
    final WeatherView weather = state.weather;
    final List<WeatherView> fiveDays = state.fiveDays;
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
                title: Text(
                  m.title,
                  style: theme.textTheme.bodyLarge,
                ),
                childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                leading: Image.asset(
                  m.weathers.first.group.imageUrl,
                  scale: 6,
                ),
                trailing: Icon(
                  Icons.expand_more,
                  color: IconTheme.of(context).color,
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
                            w.group.imageUrl,
                            scale: 8,
                          ),
                          Text(
                            DateFormat('').add_jm().format(
                                  w.weather.date ?? DateTime.now(),
                                ),
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '${w.weather.temperature?.celsius?.round()}°C',
                            style: theme.textTheme.bodyMedium,
                          ),
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
                    weatherView: weather,
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

  List<_DateListModel> _getWeathers(List<WeatherView> weathers) {
    DateFormat format = DateFormat('dd EEEE y');
    Map<DateTime, _DateListModel> setUpMap = {};
    for (WeatherView w in weathers) {
      DateTime? date = w.weather.date;
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

  List<Widget> _backgroundBlur(ThemeState state) {
    return [
      Align(
        alignment: const AlignmentDirectional(3, -0.3),
        child: Container(
          width: HomeScreen._backgroundElemSize,
          height: HomeScreen._backgroundElemSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: state.theme.getBlur().first,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-3, -0.3),
        child: Container(
          width: HomeScreen._backgroundElemSize,
          height: HomeScreen._backgroundElemSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: state.theme.getBlur().first,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          width: HomeScreen._backgroundElemSize * 2,
          height: HomeScreen._backgroundElemSize,
          decoration: BoxDecoration(
            color: state.theme.getBlur().second,
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
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    final localization = context.localization();
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

    final Widget actionButton = IconButton(
        onPressed: () => themeBloc.add(ThemeUpdateEvent()),
        icon: const Icon(Icons.sunny));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Stack(
              children: [
                ..._backgroundBlur(state),
                frontData,
              ],
            );
          },
        ),
      ),
      floatingActionButton: actionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

final class _DateListModel {
  final String title;
  final List<WeatherView> weathers;

  _DateListModel({required this.title, this.weathers = const []});
}
