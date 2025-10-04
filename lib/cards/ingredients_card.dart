import 'package:flutter/material.dart';


class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    super.key,
    required this.ingredient_name,
    required this.description,
    required this.data_value,
  });

  final String ingredient_name;
  final String description;
  final double data_value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Card(
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Text(
          ingredient_name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}