import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';

class IngedientsListCard extends StatelessWidget {
  const IngedientsListCard({
    super.key,
    required this.brew_model,
  });

  final BrewModel brew_model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.palette_outlined, size: 25,),
                  SizedBox(width: 10,),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.black54, // Customize color
                thickness: 2,      // Customize thickness
                indent: 7,        // Customize starting indent
                endIndent: 10,     // Customize ending indent
              ),

              SizedBox(height: 5,),

              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  // itemCount: brew_model.ingredient_list?.length ?? 2,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Text('data');
                  })

            ],
          ),
        ),
      ),
    );
  }
}

