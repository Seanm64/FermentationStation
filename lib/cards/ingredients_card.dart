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
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child:  Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
            children: <Widget>[
              ListTile(
                // leading: Icon(Icons.arrow_drop_down_circle),
                title: Text('${ingredient_name}',
                style: TextStyle(
                  // fontSize: 12
                ),
                ),
                subtitle: Text('ABV: ${data_value}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
        ),
    ),
    );
  }
}