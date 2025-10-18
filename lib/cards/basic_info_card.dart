import 'package:flutter/material.dart';
import 'package:fermentation_station/custom/custom_card_text_row.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({
    super.key,
    required this.leading_icon,
    required this.card_title,
    required this.info_map,
  });

  final IconData leading_icon;
  final String card_title;
  final Map<String, String> info_map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(leading_icon, size: 25,),
                  SizedBox(width: 10,),
                  Text(
                    card_title,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.black54, // Customize color
                thickness: 2,      // Customize thickness
                indent: 7,        // Customize starting indent
                endIndent: 10,     // Customize ending indent
              ),

              SizedBox(height: 5,),

              ListView.builder(
                shrinkWrap: true,
                itemCount: info_map.length,
                itemBuilder: (context, index) {
                  String key = info_map.keys.elementAt(index);
                  return CustomTextRow(leading: key, trailing: info_map[key]);
              })

            ],
          ),
        ),
      ),
    );
  }
}

