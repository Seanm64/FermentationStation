import 'package:flutter/material.dart';
import 'package:fermentation_station/structs/yeast_types.dart';
import 'package:fermentation_station/structs/sugar_gravities.dart';

class AddBrew extends StatefulWidget {
  const AddBrew({super.key});

  @override
  State<AddBrew> createState() => _AddBrewState();
}

class _AddBrewState extends State<AddBrew>
{
  List<SugarGravity> sugars_list = [];
  Map<String, Yeast>  yeast_map = {};
  String selected_yeast = '';

  void SelectYeast(String? value)
  {
    setState(() {
      selected_yeast = value!; // value comes from DropDownButton & can't be null
    });
  }

  @override
  void initState() {
    super.initState();
    sugars_list = SugarsList().GetSugarsList();
    yeast_map = YeastMap().GetMap();
    selected_yeast = 'ICV D47';
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text('Add Brew'),
          centerTitle: true,
      ),
      body: Column(
        children: <Widget>[

          // Selecting Type of Yeast to use
          DropdownButton<String>(
            onChanged: SelectYeast,
            value: yeast_map.isEmpty ? null : selected_yeast,
            items: yeast_map.entries.map((entry) {
              return DropdownMenuItem<String>(
                value: yeast_map.isNotEmpty ? entry.key : null,
                // value: selected_yeast, // The actual value associated with the item
                child: Text(entry.key), // The text displayed in the dropdown
              );
            }).toList(), // Convert the iterable to a List<DropdownMenuItem<String>>
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a Yeast Type',
            ),
          ),

          // Selection of Fruits/Sugars
          // Autocomplete(optionsBuilder: optionsBuilder)<String>(
          //   displayStringForOption:
          // ),

        ],
      ),
    );
  }
}