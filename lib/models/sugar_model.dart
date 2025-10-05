import 'package:hive/hive.dart';

part 'sugar_model.g.dart';

@HiveType(typeId: 2)
class SugarGravity {
  SugarGravity({ required this.sugar_name, required this.sugars_content_percent });

  @HiveField(0)
  String sugar_name;

  @HiveField(1)
  double sugars_content_percent;
}

final List<SugarGravity> manual_sugar_gravities_list = <SugarGravity> [
  SugarGravity(sugar_name: 'Water', sugars_content_percent: 0.0),
  SugarGravity(sugar_name: 'Sugar', sugars_content_percent: 100.0),
  SugarGravity(sugar_name: 'Honey', sugars_content_percent: 79.6),
  SugarGravity(sugar_name: 'BlueBerries', sugars_content_percent: 9.8),
  SugarGravity(sugar_name: 'Apples', sugars_content_percent: 12.4),
  SugarGravity(sugar_name: 'Apricots', sugars_content_percent: 9.1),
  SugarGravity(sugar_name: 'Apricots (Dried)', sugars_content_percent: 39.8),
  SugarGravity(sugar_name: 'Bananas', sugars_content_percent: 15.5),
];