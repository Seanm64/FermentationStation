import 'package:fermentation_station/dialog_boxes/add_sugar_dialog_box.dart';
import 'package:fermentation_station/dialog_boxes/add_yeast_dialog_box.dart';
import 'package:fermentation_station/config_lists/yeast_consumer_list.dart';
import 'package:fermentation_station/config_lists/sugar_gravity_consumer_list.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

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
                  child: YeastConsumerList()
                ),
                Flexible(
                  child: SugarConsumerList()
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
