import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fermentation_station/models/yeast_model.dart';

class YeastProvider extends ChangeNotifier {
  List<Yeast> _user_defined_yeast = <Yeast>[
    Yeast(yeast_name: 'RC 212', max_abv: 16.0),
    Yeast(yeast_name: 'ICV D47', max_abv: 14.0),
    Yeast(yeast_name: '71B-1122', max_abv: 14.0),
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
