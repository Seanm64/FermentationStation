import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';

class CheckBrewPage extends StatelessWidget {
  CheckBrewPage({
    super.key,
      required this.brew_model,
  });

  late BrewModel brew_model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brew_model.brew_title),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          Icon(Icons.more_vert, color: Colors.black87,),
        ],
      ),
      body: Column(
        children: [

          // 3 Staged Widget!!!
          // IF there are no gravity readings, display a potential gravity reading from ingredients
          // ELSE IF there is a single gravity reading, display the ingredient's potential & actual potential
          // ELSE display a chart w/ potential & actual abv w/ both ingredients and actual readings



          // Warning Area


          // Basic Information

          // Yeast Type

          // Ingredients


        ],
      ),

    );
  }
}

