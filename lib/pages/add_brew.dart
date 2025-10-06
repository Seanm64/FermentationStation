import 'package:flutter/material.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/models/ingredient_model.dart';

class AddBrew extends StatefulWidget {
  const AddBrew({super.key});

  @override
  State<AddBrew> createState() => _AddBrewState();
}

class _AddBrewState extends State<AddBrew>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}