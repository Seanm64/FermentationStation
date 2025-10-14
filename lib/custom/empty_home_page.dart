import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(),
              Icon(
                size: 80,
                Icons.view_comfortable_rounded,
              ),
              Text(
                'No brews here yet',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addBrew');
                },
                child: const Text('Try Adding a brew'),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

