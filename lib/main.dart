import 'package:app_main/app_main.dart';
import 'package:flutter/material.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}
