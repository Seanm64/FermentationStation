class SugarGravity {
  String sugar_name;
  double sugars_content_percent;

  SugarGravity({ required this.sugar_name, required this.sugars_content_percent });
}

class SugarsList {

  List<SugarGravity> GetSugarsList() {
    return sugar_gravities_list;
  }

  final List<SugarGravity> sugar_gravities_list = <SugarGravity> [
    SugarGravity(sugar_name: 'Water', sugars_content_percent: 0.0),
    SugarGravity(sugar_name: 'Sugar', sugars_content_percent: 100.0),
    SugarGravity(sugar_name: 'Honey', sugars_content_percent: 79.6),
    SugarGravity(sugar_name: 'BlueBerries', sugars_content_percent: 9.8),
    SugarGravity(sugar_name: 'Apples', sugars_content_percent: 12.4),
    SugarGravity(sugar_name: 'Apricots', sugars_content_percent: 9.1),
    SugarGravity(sugar_name: 'Apricots (Dried)', sugars_content_percent: 39.8),
    SugarGravity(sugar_name: 'Bananas', sugars_content_percent: 15.5),
  ];
}