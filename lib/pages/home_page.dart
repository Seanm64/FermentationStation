import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[200]),
      body: Column(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: const Text('Add A Brew'),
              onPressed: () {
                Navigator.pushNamed(context, '/addBrew');
              },
            ),
          ),
          Center(child: Text('Home Area')),
        ],
      ),
    );
  }
}