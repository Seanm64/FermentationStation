import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/config_lists/sugar_gravity_consumer_list.dart';
import 'package:fermentation_station/config_lists/yeast_consumer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurations'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Row(
        children: [
          Flexible(
            child: YeastConsumerList()
          ),
          Flexible(
            child: SugarConsumerList()
          ),
        ],
      ),
    );
  }
}
