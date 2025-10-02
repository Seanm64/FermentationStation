import 'package:flutter/material.dart';
import 'package:fermentation_station/structs/yeast_types.dart';

class AddBrew extends StatefulWidget {
  const AddBrew({super.key});

  @override
  State<AddBrew> createState() => _AddBrewState();
}

class _AddBrewState extends State<AddBrew>
{
  Map<String, Yeast>  yeast_map = {};
  String selected_yeast = '';

  /// initialization is here:
  @override
  void initState() {
    super.initState();
    yeast_map = YeastMap().GetMap();
    selected_yeast = 'ICV D47';
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[200]),
      body: Column(
        children: <Widget>[
          Center(child: Text('Add Brew Area')),

          // Selecting Type of Yeast to use
          DropdownButton<String>(
            onChanged: (String? value) {
              print('$value');
              setState(() {
                selected_yeast = value!;
              });
            },
            value: yeast_map.isEmpty ? null : selected_yeast,
            items: yeast_map.entries.map((entry) {
              return DropdownMenuItem<String>(
                value: yeast_map.isNotEmpty ? entry.key : null,
                // value: selected_yeast, // The actual value associated with the item
                child: Text(entry.key), // The text displayed in the dropdown
              );
            }).toList(), // Convert the iterable to a List<DropdownMenuItem<String>>
          ),
        ],
      ),
    );
  }
}