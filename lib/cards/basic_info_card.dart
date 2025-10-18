import 'package:flutter/material.dart';
import 'package:fermentation_station/models/brew_model.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    this.leading,
    this.trailing
  });

  String? leading = '';
  String? trailing = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading ?? ''),
        Text(trailing ?? ''),
      ],
    );
  }
}


class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({
    super.key,
    required this.brew_model,
  });

  final BrewModel brew_model;

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
                  Icon(Icons.info_outline, size: 25,),
                  SizedBox(width: 10,),
                  Text(
                    "Brew Information",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.black54, // Customize color
                thickness: 2,      // Customize thickness
                indent: 3,        // Customize starting indent
                endIndent: 75,     // Customize ending indent
              ),


              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Title'),
                  Text(brew_model.brew_title),
                ],
              ),

              // Start Date

              // Brew Type


            ],
          ),
        ),
      ),
    );
  }
}

