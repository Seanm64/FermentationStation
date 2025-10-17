import 'package:hive/hive.dart';

import 'ingredient_model.dart';

part 'brew_model.g.dart';

// run... $: flutter pub run build_runner build
@HiveType(typeId: 3)
enum BrewType {
  @HiveField(0)
  eWine,
  @HiveField(1)
  eMead,
  @HiveField(2)
  eCider,
  @HiveField(3)
  eBeer,
  @HiveField(4)
  eKombucha
}

@HiveType(typeId: 4)
enum VolumetricOrWeight {
  @HiveField(0)
  ePounds,
  @HiveField(1)
  eKilograms,
  @HiveField(2)
  eGrams,

  @HiveField(3)
  eGallon,
  @HiveField(4)
  eCups,
  @HiveField(5)
  eFlOz,
  @HiveField(6)
  eLiters,
  @HiveField(7)
  ePints,
  @HiveField(8)
  eQuarts,

  @HiveField(9)
  eTsp,
  @HiveField(10)
  eTbsp
}

@HiveType(typeId: 5)
class IngredientSet {

  IngredientSet({
    required this.ingredient,
    required this.volume_weight,
    required this.amount,
  });

  @HiveField(0)
  Ingredient ingredient;

  @HiveField(1)
  VolumetricOrWeight volume_weight;

  @HiveField(2)
  double amount;
}

@HiveType(typeId: 6)
class BrewModel {

  BrewModel({
    required this.date_started,
    required this.brew_title,
    required this.brew_type,
  });

  @HiveField(0)
  DateTime date_started;

  @HiveField(1)
  String brew_title;

  @HiveField(2)
  BrewType brew_type;

  @HiveField(3)
  Map<DateTime, double> gravity_readings_per_date = {};

  @HiveField(4)
  List<IngredientSet> ingredient_list = [];
}