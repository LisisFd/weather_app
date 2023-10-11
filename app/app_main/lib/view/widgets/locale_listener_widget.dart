import 'package:app_main/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

class LocaleListenerWidget extends StatefulWidget {
  final Locale defaultLocale;
  final Widget? child;

  const LocaleListenerWidget(
      {super.key, this.defaultLocale = const Locale('en_US'), this.child});

  @override
  State<LocaleListenerWidget> createState() => _LocaleListenerWidgetState();
}

class _LocaleListenerWidgetState extends State<LocaleListenerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Locale locale = Localizations.localeOf(context);
      final bloc = BlocProvider.of<WeatherBloc>(context);
      bloc.add(FetchWeather(locale));
      _updateLocale();
    });
    super.initState();
  }

  void _updateLocale() async {
    await initializeDateFormatting();
    Intl.defaultLocale = await findSystemLocale();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    final currentLocale = locales?.first ?? widget.defaultLocale;
    final bloc = BlocProvider.of<WeatherBloc>(context);
    bloc.add(FetchWeather(currentLocale));
    _updateLocale();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}
