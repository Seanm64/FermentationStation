import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';
import 'package:fermentation_station/cards/basic_info_card.dart';
import 'package:fermentation_station/utils/date_to_string.dart';

class CheckBrewPage extends StatelessWidget {
  CheckBrewPage({
    super.key,
      required this.brew_model,
  });

  late BrewModel brew_model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brew_model.brew_title),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          Icon(Icons.more_vert, color: Colors.black87,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
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
                'Start Date': DateToFullMonthString(brew_model.date_started),
                'Brew Type': brew_model.brew_type.toDisplayString(),
              },
            ),

            // Yeast Type
            BasicInfoCard(
              card_title: 'Yeast Information',
              leading_icon: Icons.sanitizer_outlined,
              info_map: {
                'Type': brew_model.yeast.yeast_name,
                'Typical ABV amount': '${brew_model.yeast.max_abv.toString()}%',
              },
            ),


            // Ingredients


          ],
        ),
      ),

    );
  }
}

