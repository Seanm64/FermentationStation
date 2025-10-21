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
    brew_title: 'Old Fashion Mead',
    brew_type: BrewType.eMead,
    yeast: Yeast(yeast_name: 'D26 - Fake Yeast', max_abv: 18.0),
    pH: 4.5,
    ingredient_list: [
      IngredientSet(ingredient: Ingredient(
        ingredient_name: 'Carrots',
        sugars_content_percent: 20,
      ),
      volume_weight: VolumetricOrWeight.eGrams,
          amount: 10,
      ),

      IngredientSet(ingredient: Ingredient(
        ingredient_name: 'Honey',
        sugars_content_percent: 79,
      ),
        volume_weight: VolumetricOrWeight.ePounds,
        amount: 1,
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
