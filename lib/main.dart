import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';
import 'package:fermentation_station/models/brew_provider.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/models/ingredient_model.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/models/yeast_provider.dart';
import 'package:fermentation_station/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/home_page.dart';
import 'pages/add_brew_page.dart';
import 'pages/configurations_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentsDir = await getApplicationDocumentsDirectory();

  // Register the generated adapter
  Hive.init(documentsDir.path);
  Hive.registerAdapter<Yeast>(YeastAdapter());
  Hive.registerAdapter<Ingredient>(IngredientAdapter());

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => YeastProvider()),
            ChangeNotifierProvider(create: (context) => IngredientProvider()),
          ],
          child: MaterialApp(
            theme: bright_theme_data,
            darkTheme: dark_theme_data,

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
}
