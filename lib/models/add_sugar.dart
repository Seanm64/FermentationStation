import 'package:fermentation_station/models/sugar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SugarGravityProvider extends ChangeNotifier {
  List<SugarGravity> _user_defined_sugar_gravities = <SugarGravity>[
    SugarGravity(sugar_name: 'Honey', sugars_content_percent: 79.0),
    SugarGravity(sugar_name: 'Sugar', sugars_content_percent: 100.0)
  ];

  List<SugarGravity> get user_sugar_gravities  => _user_defined_sugar_gravities;

  void addSugarGravity(SugarGravity sugar_gravity) {
    user_sugar_gravities.add(sugar_gravity);
    notifyListeners(); // Notifies all listeners
  }

  void removeSugarGravity(SugarGravity sugar_gravity) {
    user_sugar_gravities.remove(sugar_gravity);
    notifyListeners();
  }
}