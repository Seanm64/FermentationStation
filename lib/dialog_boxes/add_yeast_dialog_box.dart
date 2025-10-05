import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:fermentation_station/models/add_yeast.dart';
import 'package:fermentation_station/models/yeast_model.dart';
import 'package:fermentation_station/definitions/hive_boxes.dart';

class AddYeastDialogBox extends StatefulWidget {
  AddYeastDialogBox({super.key});

  @override
  State<AddYeastDialogBox> createState() => _AddYeastDialogBoxState();
}

class _AddYeastDialogBoxState extends State<AddYeastDialogBox> {
  Box? _yeastBox;

  final _yeast_form_controller = GlobalKey<FormState>();

  Yeast create_a_yeast = Yeast(yeast_name: '',
      max_abv: 0.0);

  @override
  void initState() {
    super.initState();

    Hive.openBox(kUserCreatedYeastBox).then((_box) {
      setState(() {
        _yeastBox = _box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: Text('Create Your Own Yeast'),
      content: SingleChildScrollView(
          child: Form(
            key: _yeast_form_controller,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  onSaved: (value) {
                    create_a_yeast.yeast_name = value!;
                  },
                  validator: (value) {
                    if(value == null ||
                        value.isEmpty)
                    { return 'You must enter a valid value'; }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Enter Yeast Name'),
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
                    create_a_yeast.max_abv = double.parse(value!);
                  },
                  decoration: const InputDecoration(
                      label: Text('Strain Max ABV count')
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_yeast_form_controller.currentState!.validate())
                    {
                      _yeast_form_controller.currentState!.save();
                      context.read<AddYeast>().addYeast(create_a_yeast);

                      _yeastBox!.put(create_a_yeast.yeast_name,
                          create_a_yeast);

                      _yeast_form_controller.currentState!.reset();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create Yeast'),

                ),
              ],
            ),
          )
      ),
    );
  }
}

