import 'package:flutter/material.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/models/sugar_model.dart';
import 'package:fermentation_station/models/add_sugar.dart';
import 'package:fermentation_station/models/add_yeast.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/home_page.dart';
import 'pages/add_brew.dart';
import 'pages/configurations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentsDir = await getApplicationDocumentsDirectory();

  // Register the generated adapter
  Hive.init(documentsDir.path);
  Hive.registerAdapter<Yeast>(YeastAdapter());
  Hive.registerAdapter<SugarGravity>(SugarGravityAdapter());

  runApp(
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
}
