import 'package:flutter/material.dart';
import 'package:fermentation_station/structs/yeast_types.dart';

class AddBrew extends StatelessWidget {
  const AddBrew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[200]),
      body: Column(
        children: <Widget>[
          Center(child: Text('Add Brew Area')),

          // Selecting Type of Yeast to use



        ],
      ),
    );
  }
}