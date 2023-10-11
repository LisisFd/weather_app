import 'package:app_main/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(DarkTheme())) {
    on<ThemeUpdateEvent>((event, emit) {
      ITheme theme = state.theme;
      if (theme is DarkTheme) {
        theme = LightTheme();
      } else {
        theme = DarkTheme();
      }
      emit(ThemeUpdateState(theme));
    });
  }
}
