import 'package:flutter/material.dart';

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
          Text(
            leading ?? '',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),

          ),
          Text(
            trailing ?? '',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold
            ),

          ),
        ],
      ),
    );
  }
}