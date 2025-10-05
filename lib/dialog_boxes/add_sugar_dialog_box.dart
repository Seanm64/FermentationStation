import 'package:fermentation_station/definitions/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:fermentation_station/models/add_sugar.dart';
import 'package:fermentation_station/models/sugar_model.dart';

class AddSugarDialogBox extends StatefulWidget {
  AddSugarDialogBox({super.key});

  @override
  State<AddSugarDialogBox> createState() => _AddSugarDialogBoxState();
}

class _AddSugarDialogBoxState extends State<AddSugarDialogBox> {
  Box? _sugarBox;

  final _sugar_form_controller = GlobalKey<FormState>();

  SugarGravity create_a_sugar = SugarGravity(sugar_name: '',
    sugars_content_percent: 0.0);

  @override
  void initState() {
    super.initState();

    Hive.openBox(kUserCreatedSugarGravitiesBox).then((_box) {
      setState(() {
        _sugarBox = _box;
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
            key: _sugar_form_controller,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  onSaved: (value) {
                    create_a_sugar.sugar_name = value!;
                  },
                  validator: (value) {
                    if(value == null ||
                        value.isEmpty)
                    { return 'You must enter a valid value'; }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Enter Sugar Name'),
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
                    create_a_sugar.sugars_content_percent = double.parse(value!);
                  },
                  decoration: const InputDecoration(
                      label: Text('Enter Sugar Content %')
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_sugar_form_controller.currentState!.validate())
                    {
                      _sugar_form_controller.currentState!.save();
                      context.read<AddSugarGravity>().addSugarGravity(create_a_sugar);

                      _sugarBox!.put(create_a_sugar.sugar_name,
                          create_a_sugar);

                      _sugar_form_controller.currentState!.reset();
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

