import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("Home Page"),
          centerTitle: true,
      ),
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
        ],
      ),
    );
  }
}