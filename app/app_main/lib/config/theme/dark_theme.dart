import 'package:flutter/material.dart';

import 'i_theme.dart';

final class DarkTheme extends BaseTheme {
  DarkTheme({super.brightness = Brightness.dark});

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme = ColorScheme.dark(background: Colors.black);
    return ThemeData(
        colorScheme: colorScheme,
        appBarTheme: appBarTheme,
        useMaterial3: true,
        textTheme: textTheme);
  }
}
