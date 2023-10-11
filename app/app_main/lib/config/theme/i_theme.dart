import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlurColors {
  final Color first;
  final Color second;
  const BlurColors({required this.first, required this.second});
}

abstract interface class ITheme {
  final Brightness brightness;

  ITheme({required this.brightness});
  ThemeData getTheme();
  BlurColors getBlur();
}

abstract base class BaseTheme extends ITheme {
  BaseTheme({required super.brightness});

  AppBarTheme get appBarTheme => AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
        ),
      );

  TextTheme get textTheme => const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
      );
}
