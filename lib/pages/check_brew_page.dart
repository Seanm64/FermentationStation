import 'package:fermentation_station/theme_data.dart';
import 'package:fermentation_station/utils/abv_calulations.dart';
import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';
import 'package:fermentation_station/cards/basic_info_card.dart';
import 'package:fermentation_station/cards/ingedients_list_card.dart';
import 'package:fermentation_station/utils/date_to_string.dart';

class CheckBrewPage extends StatelessWidget {
  CheckBrewPage({
    super.key,
      required this.brew_model,
  });

  late BrewModel brew_model;
  double? estimated_gravity;
  double? current_abv;


  @override
  Widget build(BuildContext context) {

  String? estimated_abv = GetAbv(brew_model.initial_gravity_reading, 1.0)?.toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        title: Text(brew_model.brew_title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black87,),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [

            // 3 Staged Widget!!!
            // IF there are no gravity readings, display a potential gravity reading from ingredients
            // ELSE IF there is a single gravity reading, display the ingredient's potential & actual potential
            // ELSE display a chart w/ potential & actual abv w/ both ingredients and actual readings



            // Warning Area


            // Brew Information
            BasicInfoCard(
              card_title: 'Brew Information',
              leading_icon: Icons.info_outline,
              info_map: {
                'Title': brew_model.brew_title,
                'Start Date': DateToFullMonthString(brew_model.date_started, true),
                'Brew Type': brew_model.brew_type.toDisplayString(),
              },
            ),

            // Yeast Type
            BasicInfoCard(
              card_title: 'Yeast Information',
              leading_icon: Icons.sanitizer_outlined,
              info_map:  {
                'Type': brew_model.yeast.yeast_name,
                'Typical ABV Max': '${brew_model.yeast.max_abv.toString()}%',
                if (brew_model.pH != null) 'pH': brew_model.pH.toString(),
              },
            ),


            // Ingredients
            IngedientsListCard(brew_model: brew_model),


            // Gravity Calculations
            BasicInfoCard(
                leading_icon: Icons.table_bar_outlined,
                card_title: 'Gravity Calculations',
                info_map: {
                  'Original Gravity' : brew_model.initial_gravity_reading?.toString() ?? 'None Supplied',
                  'Estimated Gravity' : 'TODO: Calculate estimated Gravity',
                  'Current ABV' : 'TODO: Calculate Estimated ABV',
                  'Estimated ABV' : (estimated_abv != null) ? '${estimated_abv}%' : 'N/A',
                }
            ),


          ],
        ),
      ),

    );
  }
}

