import 'package:fermentation_station/cards/brew_card.dart';
import 'package:flutter/material.dart';


class BrewCardsList extends StatefulWidget {
  const BrewCardsList({super.key});

  @override
  State<BrewCardsList> createState() => _BrewCardsListState();
}

class _BrewCardsListState extends State<BrewCardsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(8)
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BrewCard(),
            )
          ],
        ),
      ),
    );
  }
}
