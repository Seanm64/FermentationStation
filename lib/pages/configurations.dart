import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/config_lists/sugar_gravity_consumer_list.dart';
import 'package:fermentation_station/config_lists/yeast_consumer_list.dart';
import 'package:fermentation_station/models/sugar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/models/yeast_model.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  final _yeast_form_controller = GlobalKey<FormState>();
  final _sugar_form_controller = GlobalKey<FormState>();

  Yeast create_a_yeast = Yeast(yeast_name: '',
      max_abv: 0.0);
  SugarGravity create_a_sugar = SugarGravity(sugar_name: '',
      sugars_content_percent: 0.0);

  void _showCreateYeastDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Text('Create Your Own Yeast'),
            content: SingleChildScrollView(
              child: Form(
                key: _yeast_form_controller,
                child: Column(
                  children: [
                    TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Enter Yeast Name')
                    ),
                  ),
                    TextFormField(
                      maxLength: 20, keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Strain Max ABV count')
                      ),
                    ),
                  ],
                ),
              )
            ),
          );
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
                  onPressed: () {},
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
