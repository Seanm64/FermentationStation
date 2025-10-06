import 'package:flutter/material.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/cards/ingredients_card.dart';
import 'package:provider/provider.dart';

class IngredientsConsumerList extends StatelessWidget {
  const IngredientsConsumerList({super.key, required this.deleteFunction});

  final Function(String key) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientProvider>(
        builder: (context, ingredient, child) {
          return ListView.builder(
              itemCount: ingredient.user_ingredients.length,
              itemBuilder: (BuildContext context, index) {
                return IngredientsCard(
                  ingredient_name: ingredient.user_ingredients[index].ingredient_name,
                  description: '',
                  data_value: ingredient.user_ingredients[index].sugars_content_percent,
                  card_type: CardType.eIngredientCard,
                  deleteFunction: deleteFunction,
                );
              }
          );
        }
    );
  }
}