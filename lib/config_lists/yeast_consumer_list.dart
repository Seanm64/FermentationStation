import 'package:flutter/material.dart';
import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/cards/ingredients_card.dart';
import 'package:provider/provider.dart';

class YeastConsumerList extends StatefulWidget {
  const YeastConsumerList({super.key});

  @override
  State<YeastConsumerList> createState() => _YeastConsumerListState();
}

class _YeastConsumerListState extends State<YeastConsumerList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddYeast>(
        builder: (context, yeast, child) {
          return ListView.builder(
              itemCount: yeast.user_yeast.length,
              itemBuilder: (BuildContext context, index) {
                return IngredientsCard(
                  ingredient_name: yeast.user_yeast[index].yeast_name,
                  description: '',
                  data_value: yeast.user_yeast[index].max_abv,
                  card_type: CardType.eYeastCard,
                );
              }
          );
        }
    );
  }
}