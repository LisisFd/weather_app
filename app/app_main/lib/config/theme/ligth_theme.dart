import 'package:flutter/material.dart';

import 'i_theme.dart';

final class LightTheme extends BaseTheme {
  LightTheme({super.brightness = Brightness.light});

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme = ColorScheme.dark(background: Colors.black);

    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
    );
  }
}
