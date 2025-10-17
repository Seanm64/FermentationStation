import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';

class CheckBrewPage extends StatelessWidget {
  CheckBrewPage({
    super.key,
      required this.brew_model,
  }
  );

  late BrewModel brew_model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),

    );
  }
}

