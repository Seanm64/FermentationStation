import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/definitions/hive_boxes.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/models/yeast_provider.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/models/ingredient_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    // Put all of the user defined Yeast's into the provider
    Hive.openBox(kUserCreatedYeastBox).then((_yeast_box) {
      for(var key in _yeast_box.keys)
      {
        Yeast yeast = _yeast_box.get(key);
        context.read<YeastProvider>().addYeast(yeast);
      }

      // Put all of the user defined ingredients into the provider
      Hive.openBox(kUserCreatedIngredientsBox).then((_ingredients_box) {
        for(var key in _ingredients_box.keys)
        {
          Ingredient ingredient = _ingredients_box.get(key);
          context.read<IngredientProvider>().addIngredient(ingredient);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("Home Page"),
          centerTitle: true,
      ),

      // Drawer
      drawer: Drawer(
        width: 200.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 150.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Text('Fermentation Station'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wine_bar_outlined),
              title: const Text('Make A Brew'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addBrew');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuration'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/config');
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: const Text('Add A Brew'),
              onPressed: () {
                Navigator.pushNamed(context, '/addBrew');
              },
            ),
          ),
        ],
      ),
    );
  }
}
