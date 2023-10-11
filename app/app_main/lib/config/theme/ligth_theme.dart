import 'package:flutter/material.dart';

import 'i_theme.dart';

final class LightTheme extends BaseTheme {
  LightTheme({super.brightness = Brightness.light});

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme = ColorScheme.dark(background: Colors.white);

    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }

  @override
  TextTheme get textTheme => const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 15),
      );

  @override
  BlurColors getBlur() {
    return const BlurColors(
        first: Color(0xFFB8B23B), second: Color(0xFF40BBFF));
  }
}
