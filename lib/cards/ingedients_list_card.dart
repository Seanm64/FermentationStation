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
                  itemCount: brew_model.ingredient_list?.length ?? 0,
                  itemBuilder: (context, index) {
                    if(brew_model.ingredient_list == null) return Text(''); // Null Check
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadiusGeometry.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [

                              // Amount
                              SizedBox(
                                width: 50,
                                  child: Text(
                                    brew_model.ingredient_list![index].amount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                              ),
                              SizedBox(width: 5,),

                              // Volume / Weight Descriptor
                              SizedBox(
                                width: 60,
                                child: Text(
                                  brew_model.ingredient_list![index].volume_weight.toDisplayString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),

                              // Ingredient Name
                              Text(
                                brew_model.ingredient_list![index].ingredient.ingredient_name,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.more_vert,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })

            ],
          ),
        ),
      ),
    );
  }
}

