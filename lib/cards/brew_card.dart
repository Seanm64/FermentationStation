import 'package:flutter/material.dart';
import 'package:fermentation_station/custom/custom_icon_button.dart';
import 'package:fermentation_station/pages/check_brew_page.dart';
import 'package:fermentation_station/models/brew_model.dart';

class BrewCard extends StatelessWidget {
   BrewCard({
     super.key,
     required this.brew_model
   });

  late BrewModel brew_model;
  bool is_latest = true;

  int? _calculateDayDifference(DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      // Create new DateTime objects with only year, month, and day
      // to avoid issues with time components affecting the day count.
      final DateTime startDay = DateTime(startDate.year, startDate.month, startDate.day);
      final DateTime endDay = DateTime(endDate.year, endDate.month, endDate.day);

      final Duration difference = endDay.difference(startDay);
      return(difference.inDays);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckBrewPage(brew_model: brew_model)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(14),
        ),
        margin: EdgeInsets.all(5),
        child: Column(
          children: [

            // Icon, Brew Type, days old
            Container(
              color: Colors.blueGrey[300],
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.wine_bar),
                  Text(
                    brew_model.brew_type.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  if(is_latest) Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadiusGeometry.circular(12)
                        ),
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'Latest',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                    ),
                    SizedBox(height: 0, width:5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: Text(
                        // '${_calculateDayDifference(brewStarted, now)} Days Old',
                        '${_calculateDayDifference(DateTime(2025, 10, 1), DateTime.now())} Days Old',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), // End of top row

            // Body of card
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Title, Starting Date, ABV
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brew_model.brew_title,
                          style: TextStyle(
                            fontSize: 20,
                          )
                        ),
                        Text('Started: ...'),
                        Text('Current 1005, ABV 15.8%'),
                      ],
                    ),


                    // Picture of drink
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.info_outline,
                            size: 60,
                            color: Colors.black26,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomIconButton(
                                onTap: () {},
                                icon: Icon(Icons.add,
                                  size: 20,
                                ),
                              ),CustomIconButton(
                                onTap: () {},
                                icon: Icon(Icons.add,
                                  size: 20,),
                              ),CustomIconButton(
                                onTap: () {},
                                icon: Icon(Icons.add,
                                  size: 20,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

