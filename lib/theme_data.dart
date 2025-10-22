import 'package:flutter/material.dart';

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);

const COLOR_WHITE = Colors.white;
const COLOR_BLUE_GREY = Colors.blueGrey;

const TextTheme text_theme = TextTheme(
  labelLarge: TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
  ),
  labelMedium: TextStyle( // Brew Cards
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  labelSmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
);

const TextStyle cardText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
const TextStyle cardTextBlueBold = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

ThemeData bright_theme_data = ThemeData(
  brightness: Brightness.light,
  textTheme: text_theme,
  colorScheme: ColorScheme.light(
    background: COLOR_WHITE,
    primary: COLOR_BLUE_GREY,
    secondary: Colors.blueGrey.shade200,
  ),
);

ThemeData dark_theme_data = ThemeData(
  brightness: Brightness.dark,
  textTheme: text_theme,
  colorScheme: ColorScheme.dark(
    background: Colors.white10,
    primary: Colors.deepPurple,
    secondary: Colors.blueGrey.shade200,
  ),
);
