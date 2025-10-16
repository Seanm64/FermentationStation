import 'package:hive/hive.dart';

part 'ingredient_model.g.dart';

// run... $: flutter pub run build_runner build
@HiveType(typeId: 2)
class Ingredient {
  Ingredient({ required this.ingredient_name, required this.sugars_content_percent });

  @HiveField(0)
  String ingredient_name;

  @HiveField(1)
  double sugars_content_percent;
}

final List<Ingredient> manual_ingredients_list = <Ingredient> [
  Ingredient(ingredient_name: 'Water', sugars_content_percent: 0.0),
  Ingredient(ingredient_name: 'Sugar', sugars_content_percent: 100.0),
  Ingredient(ingredient_name: 'Honey', sugars_content_percent: 79.6),
  Ingredient(ingredient_name: 'BlueBerries', sugars_content_percent: 9.8),
  Ingredient(ingredient_name: 'Apples', sugars_content_percent: 12.4),
  Ingredient(ingredient_name: 'Apricots', sugars_content_percent: 9.1),
  Ingredient(ingredient_name: 'Apricots (Dried)', sugars_content_percent: 39.8),
  Ingredient(ingredient_name: 'Bananas', sugars_content_percent: 15.5),
];