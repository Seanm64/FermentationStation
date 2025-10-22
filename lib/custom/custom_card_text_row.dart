import 'package:fermentation_station/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    this.leading,
    this.trailing
  });

  final String? leading;
  final String? trailing;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextScroll(
              leading ?? '',
              style: cardText,
              velocity: Velocity(pixelsPerSecond: Offset(40, 0)),
              delayBefore: Duration(milliseconds: 100),
              pauseBetween: Duration(milliseconds: 100),
              textAlign: TextAlign.left,
              mode: TextScrollMode.bouncing,
            ),
          ),

          Expanded(
            child: TextScroll(
                trailing ?? '',
                style: cardTextBlueBold,
                velocity: Velocity(pixelsPerSecond: Offset(40, 0)),
                delayBefore: Duration(milliseconds: 100),
                pauseBetween: Duration(milliseconds: 100),
                textAlign: TextAlign.right,
                mode: TextScrollMode.bouncing,
              ),
          ),
        ],
      ),
    );
  }
}