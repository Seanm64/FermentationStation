import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/add_brew.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Column(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: const Text('Go To Home'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          SizedBox(height: 100.0),
          Center(child: Text('LOADING AREA')),
        ],
      ),
    );
  }
}

void main() => runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => MyApp(),
        '/home': (context) => Home(),
        '/addBrew': (context) => AddBrew(),
      },
    )
);