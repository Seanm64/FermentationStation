import 'package:fermentation_station/cards/brew_card.dart';
import 'package:fermentation_station/models/brew_model.dart';
import 'package:fermentation_station/models/ingredient_model.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:flutter/material.dart';


class BrewCardsList extends StatefulWidget {
  const BrewCardsList({super.key});

  @override
  State<BrewCardsList> createState() => _BrewCardsListState();
}

class _BrewCardsListState extends State<BrewCardsList> {

  BrewModel brewModel = BrewModel(
    date_started: DateTime.now(),
    brew_title: 'Cranberry Apple Cider',
    brew_type: BrewType.eCider,
    yeast: Yeast(yeast_name: "Fleicshmann's Yeast", max_abv: 12.0),
    initial_gravity_reading: 1.045,
    pH: 4.2,
    ingredient_list: [
      IngredientSet(ingredient: Ingredient(
        ingredient_name: 'Cranberry Juice',
        sugars_content_percent: 55,
      ),
      volume_weight: VolumetricOrWeight.eGallon,
          amount: 0.5,
      ),

      IngredientSet(ingredient: Ingredient(
        ingredient_name: 'Apple Juice',
        sugars_content_percent: 79,
      ),
        volume_weight: VolumetricOrWeight.eGallon,
        amount: 0.5,
      ),

      IngredientSet(ingredient: Ingredient(
        ingredient_name: 'Baking Soda',
        sugars_content_percent: 0,
      ),
        volume_weight: VolumetricOrWeight.eTsp,
        amount: 1.0,
      ),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(brew_model: brewModel,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(brew_model: brewModel,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(brew_model: brewModel,),
            )
          ],
        ),
      ),
    );
  }
}
