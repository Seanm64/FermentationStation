import 'package:fermentation_station/models/ingredient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IngredientProvider extends ChangeNotifier {
  List<Ingredient> _user_defined_ingredients = <Ingredient>[
  ];

  List<Ingredient> get user_ingredients  => _user_defined_ingredients;

  void addIngredient(Ingredient ingredient) {
    user_ingredients.add(ingredient);
    notifyListeners(); // Notifies all listeners
  }

  void removeIngredient(Ingredient ingredient) {
    user_ingredients.remove(ingredient);
    notifyListeners();
  }
}