import 'package:fermentation_station/models/add_sugar.dart';
import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/pages/configurations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/add_brew.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddYeast()),
        ChangeNotifierProvider(create: (context) => AddSugarGravity()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addBrew': (context) => AddBrew(),
        '/config': (context) => Configuration(),
      },
    )
  )
);
