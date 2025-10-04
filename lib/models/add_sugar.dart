import 'package:fermentation_station/models/sugar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddSugarGravity extends ChangeNotifier {
  List<SugarGravity> _user_defined_sugar_gravities = <SugarGravity>[
  ];

  List<SugarGravity> get user_sugar_gravities  => _user_defined_sugar_gravities;

  void addYeast(SugarGravity sugar_gravity) {
    user_sugar_gravities.add(sugar_gravity);
    notifyListeners(); // Notifies all listeners
  }

  void removeYeast(SugarGravity sugar_gravity) {
    user_sugar_gravities.remove(sugar_gravity);
    notifyListeners();
  }
}