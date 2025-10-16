import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, this.onTap});

  final Icon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(2.0),
          child: Container(
            color: Colors.blueGrey[600],
            child: icon,
          ),
        ),
      ),
    );
  }
}

