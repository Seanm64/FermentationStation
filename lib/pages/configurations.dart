import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/models/yeast_provider.dart';
import 'package:fermentation_station/dialog_boxes/add_ingredient_box.dart';
import 'package:fermentation_station/dialog_boxes/add_yeast_dialog_box.dart';
import 'package:fermentation_station/config_lists/yeast_consumer_list.dart';
import 'package:fermentation_station/config_lists/ingredient_consumer_list.dart';

import 'package:fermentation_station/definitions/hive_boxes.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  Box? _yeastBox;
  Box? _ingredientsBox;

  void DeleteYeastFunction(String key) async {
    var yeast_obj = _yeastBox!.get(key);
    await _yeastBox!.delete(key);
    context.read<YeastProvider>().removeYeast(yeast_obj);
  }

  void DeleteIngredientFunction(String key) async {
    var ingredient_obj = _ingredientsBox!.get(key);
    await _ingredientsBox!.delete(key);
    context.read<IngredientProvider>().removeIngredient(ingredient_obj);
  }

  void _showCreateYeastDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddYeastDialogBox();
        }
    );
  }

  void _showCreateIngredientDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddIngredientDialogBox();
        }
    );
  }

  @override
  void initState() {
    super.initState();

    Hive.openBox(kUserCreatedIngredientsBox).then((_box) {
      setState(() {
        _ingredientsBox = _box;
      });
    });
    Hive.openBox(kUserCreatedYeastBox).then((_box) {
      setState(() {
        _yeastBox = _box;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurations'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Yeast Strains',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: YeastConsumerList(deleteFunction: DeleteYeastFunction,)
                ),
                Flexible(
                  child: IngredientsConsumerList(deleteFunction: DeleteIngredientFunction,)
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _showCreateYeastDialog,
                    child: const Text("Add Yeast"),
                ),
                ElevatedButton(
                  onPressed: _showCreateIngredientDialog,
                  child: const Text("Add Ingredient"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
