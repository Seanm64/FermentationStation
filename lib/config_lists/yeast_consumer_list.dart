import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/models/yeast_provider.dart';
import 'package:fermentation_station/cards/ingredients_card.dart';

class YeastConsumerList extends StatelessWidget {
  const YeastConsumerList( {super.key, required this.deleteFunction} );

  final Function(String key) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Consumer<YeastProvider>(
        builder: (context, yeast, child) {
          return ListView.builder(
              itemCount: yeast.user_yeast.length,
              itemBuilder: (BuildContext context, index) {
                return IngredientsCard(
                  ingredient_name: yeast.user_yeast[index].yeast_name,
                  description: '',
                  data_value: yeast.user_yeast[index].max_abv,
                  card_type: CardType.eYeastCard,
                  deleteFunction: deleteFunction,
                );
              }
          );
        }
    );
  }
}