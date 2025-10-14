import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/definitions/hive_boxes.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/models/yeast_provider.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/models/ingredient_model.dart';
import 'package:fermentation_station/custom/HomeDrawer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isThereABrew = false;

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
          backgroundColor: Colors.blueGrey,
          title: Text("Fermentation Station"),
          centerTitle: true,
      ),

      // Drawer
      drawer: HomeDrawer(),

      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Text(
              'Check on your brews!',
              style: GoogleFonts.lobster(
                fontSize: 23,
              ),
            ),
          ),

          SizedBox(height: 20,),

          // If there are no brews, display area where there should be brews
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          'No brews here yet',
                          style: GoogleFonts.comicNeue(
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Try Adding a brew'),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              )
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
