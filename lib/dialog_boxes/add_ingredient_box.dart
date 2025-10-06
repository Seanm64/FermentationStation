import 'package:fermentation_station/definitions/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:fermentation_station/models/ingredient_provider.dart';
import 'package:fermentation_station/models/ingredient_model.dart';

class AddIngredientDialogBox extends StatefulWidget {
  AddIngredientDialogBox({super.key});

  @override
  State<AddIngredientDialogBox> createState() => _AddIngredientDialogBoxState();
}

class _AddIngredientDialogBoxState extends State<AddIngredientDialogBox> {
  Box? _ingredientsBox;

  final _ingredients_form_controller = GlobalKey<FormState>();

  Ingredient create_an_ingredient = Ingredient(ingredient_name: '',
    sugars_content_percent: 0.0);

  @override
  void initState() {
    super.initState();

    Hive.openBox(kUserCreatedIngredientsBox).then((_box) {
      setState(() {
        _ingredientsBox = _box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: Text('Create Your Own Ingredient'),
      content: SingleChildScrollView(
          child: Form(
            key: _ingredients_form_controller,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  onSaved: (value) {
                    create_an_ingredient.ingredient_name = value!;
                  },
                  validator: (value) {
                    if(value == null ||
                        value.isEmpty)
                    { return 'You must enter a valid value'; }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Enter Ingredient Name'),
                  ),
                ),
                TextFormField(
                  maxLength: 6, keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null ||
                        value.isEmpty ||
                        value.contains(RegExp(r'[A-Z][a-z]')))
                    {
                      return 'You must enter a number (ex. 1, 2, 10.4, 74.5)';
                    }

                    if(double.parse(value) > 100.0) {
                      return 'Number must be <= 100.0';
                    }
                    if(double.parse(value) < 0.0) {
                      return 'Number must be >= to 0.0';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    create_an_ingredient.sugars_content_percent = double.parse(value!);
                  },
                  decoration: const InputDecoration(
                      label: Text('Enter Sugar Content %')
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_ingredients_form_controller.currentState!.validate())
                    {
                      _ingredients_form_controller.currentState!.save();
                      context.read<IngredientProvider>().addIngredient(create_an_ingredient);

                      _ingredientsBox!.put(create_an_ingredient.ingredient_name,
                          create_an_ingredient);

                      _ingredients_form_controller.currentState!.reset();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create Ingredient'),

                ),
              ],
            ),
          )
      ),
    );
  }
}

