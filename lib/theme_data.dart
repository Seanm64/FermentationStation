import 'package:flutter/material.dart';


ThemeData bright_theme_data = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.blueGrey,
    secondary: Colors.blueGrey.shade200,
  ),
);

ThemeData dark_theme_data = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.white10,
    primary: Colors.deepPurple,
    secondary: Colors.blueGrey.shade200,
  ),
);