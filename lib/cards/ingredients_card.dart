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
    required this.card_type,
    required this.deleteFunction
  });

  final String ingredient_name;
  final String description;
  final double data_value;
  final CardType card_type;
  final Function(String key) deleteFunction;

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
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
                subtitle: Text(
                  card_type == CardType.eYeastCard ? 'ABV: ${data_value}' :
                  'Sugar %: ${data_value}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),trailing: GestureDetector(
                  onTap: () => deleteFunction(ingredient_name),
                  child: Icon(Icons.delete),
                ),
              ),
            ],
        ),
    ),
    );
  }
}