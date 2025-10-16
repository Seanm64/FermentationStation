import 'package:hive/hive.dart';

import 'ingredient_model.dart';

enum BrewType {
  eWine,
  eMead,
  eBeer,
  eKombucha
}

enum VolumetricOrWeight {
  ePounds,
  eKilograms,
  eGrams,

  eLiters,

  eTsp,
  eTbsp
}

class IngredientSet {

  Ingredient ingredient;

  VolumetricOrWeight volume_weight;

  double amount;

}

class BrewModel {
  DateTime date_started;

  String brew_title;

  BrewType brew_type;

  Map<DateTime, double> gravity_readings_per_date;

}