import 'package:flutter/material.dart';

const seedColor = Colors.blue;

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: ListTileThemeData(iconColor: seedColor));
      
}
