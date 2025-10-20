import 'package:fermentation_station/models/yeast_model.dart';
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
  eMilliLiters,
  @HiveField(8)
  ePints,
  @HiveField(9)
  eQuarts,

  @HiveField(10)
  eTsp,
  @HiveField(11)
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
    required this.yeast,
    this.pH,
    this.gravity_readings_per_date,
    this.ingredient_list
    }
  );

  @HiveField(0)
  DateTime date_started;

  @HiveField(1)
  String brew_title;

  @HiveField(2)
  BrewType brew_type;

  @HiveField(3)
  Yeast yeast;

  @HiveField(4)
  double? pH = 0.0;

  @HiveField(5)
  Map<DateTime, double>? gravity_readings_per_date = {};

  @HiveField(6)
  List<IngredientSet>? ingredient_list = [];
}


// toString method for Volumetric Names
extension VolumeWeightName on VolumetricOrWeight {
  String toDisplayString() {
    switch (this) {
      case VolumetricOrWeight.ePounds:
        return 'lbs';
      case VolumetricOrWeight.eKilograms:
        return 'kg';
      case VolumetricOrWeight.eGrams:
        return 'grams';
      case VolumetricOrWeight.eGallon:
        return 'Gallons';
      case VolumetricOrWeight.eCups:
        return 'Cups';
      case VolumetricOrWeight.eFlOz:
        return 'FlOz';
      case VolumetricOrWeight.eLiters:
       return 'L';
      case VolumetricOrWeight.eMilliLiters:
        return 'mL';
      case VolumetricOrWeight.ePints:
        return 'Pints';
      case VolumetricOrWeight.eQuarts:
        return 'Quarts';
      case VolumetricOrWeight.eTsp:
        return 'Tsp';
      case VolumetricOrWeight.eTbsp:
        return 'Tbsp';
    }
  }
}


// toString method for Brew Types
extension BrewTypeNames on BrewType {
  String toDisplayString() {
    switch (this) {
      case BrewType.eWine:
        return 'Wine';
      case BrewType.eMead:
        return 'Mead';
      case BrewType.eCider:
        return 'Cider';
      case BrewType.eBeer:
        return 'Beer';
      case BrewType.eKombucha:
        return 'Kombucha';
    }
  }
}