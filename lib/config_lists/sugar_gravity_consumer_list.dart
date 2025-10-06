import 'package:flutter/material.dart';
import 'package:fermentation_station/models/add_sugar.dart';
import 'package:fermentation_station/cards/ingredients_card.dart';
import 'package:provider/provider.dart';

class SugarConsumerList extends StatelessWidget {
  const SugarConsumerList({super.key, required this.deleteFunction});

  final Function(String key) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Consumer<SugarGravityProvider>(
        builder: (context, sugar, child) {
          return ListView.builder(
              itemCount: sugar.user_sugar_gravities.length,
              itemBuilder: (BuildContext context, index) {
                return IngredientsCard(
                  ingredient_name: sugar.user_sugar_gravities[index].sugar_name,
                  description: '',
                  data_value: sugar.user_sugar_gravities[index].sugars_content_percent,
                  card_type: CardType.eSugarGravityCard,
                  deleteFunction: deleteFunction,
                );
              }
          );
        }
    );
  }
}