import 'package:flutter/material.dart';

enum CardType {
  eYeastCard,
  eSugarGravityCard
}

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    super.key,
    required this.ingredient_name,
    required this.description,
    required this.data_value,
    required this.card_type
  });

  final String ingredient_name;
  final String description;
  final double data_value;
  final CardType card_type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child:  Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
            children: <Widget>[
              ListTile(
                title: Text('${ingredient_name}',
                style: TextStyle(
                  // fontSize: 12
                ),
                ),
                subtitle: Text(
                  card_type == CardType.eYeastCard ? 'ABV: ${data_value}' :
                  'Sugar %: ${data_value}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),trailing: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.delete),
                ),
              ),
            ],
        ),
    ),
    );
  }
}