import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/models/add_sugar.dart';
import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/dialog_boxes/add_sugar_dialog_box.dart';
import 'package:fermentation_station/dialog_boxes/add_yeast_dialog_box.dart';
import 'package:fermentation_station/config_lists/yeast_consumer_list.dart';
import 'package:fermentation_station/config_lists/sugar_gravity_consumer_list.dart';

import 'package:fermentation_station/definitions/hive_boxes.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  Box? _yeastBox;
  Box? _sugarBox;

  void DeleteYeastFunction(String key) async {
    var yeast_obj = _yeastBox!.get(key);
    await _yeastBox!.delete(key);
    context.read<YeastProvider>().removeYeast(yeast_obj);
  }

  void DeleteSugarFunction(String key) async {
    var sugar_grav_obj = _sugarBox!.get(key);
    await _sugarBox!.delete(key);
    context.read<SugarGravityProvider>().removeSugarGravity(sugar_grav_obj);
  }

  void _showCreateYeastDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddYeastDialogBox();
        }
    );
  }

  void _showCreateSugarDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddSugarDialogBox();
        }
    );
  }

  @override
  void initState() {
    super.initState();

    Hive.openBox(kUserCreatedSugarGravitiesBox).then((_box) {
      setState(() {
        _sugarBox = _box;
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
                'Sugars',
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
                  child: SugarConsumerList(deleteFunction: DeleteSugarFunction,)
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
                  onPressed: _showCreateSugarDialog,
                  child: const Text("Add Sugar"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
