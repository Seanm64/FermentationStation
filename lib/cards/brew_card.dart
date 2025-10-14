import 'package:flutter/material.dart';

class BrewCard extends StatelessWidget {
  const BrewCard({super.key});

  final String BrewType = 'Mead';
  final String Title = 'Title';
  final int DaysOld = 26;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(BrewType),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Text(
                      '$DaysOld Days Old',
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Title, Starting Date, ABV
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Title),
                    Text('Started: ...'),
                    Text('Current 1005, ABV 15.8%'),
                  ],
                ),


                // Picture of drink
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.info_outline),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}

