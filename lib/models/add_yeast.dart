import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fermentation_station/models/yeast_model.dart';

class AddYeast extends ChangeNotifier {
  List<Yeast> _user_defined_yeast = <Yeast>[
  ];

  List<Yeast> get user_yeast  => _user_defined_yeast;

  void addYeast(Yeast yeast) {
    user_yeast.add(yeast);
    notifyListeners(); // Notifies all listeners
  }

  void removeYeast(Yeast yeast) {
    user_yeast.remove(yeast);
    notifyListeners();
  }
}
