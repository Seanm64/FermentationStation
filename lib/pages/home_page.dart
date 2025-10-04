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

      // Drawer
      drawer: Drawer(
        width: 200.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 150.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Text('Fermentation Station'),
              ),
            ),
            ListTile(
              title: const Text('Make A Brew'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addBrew');
              },
            ),
            ListTile(
              title: const Text('Configuration'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/config');
              },
            ),
          ],
        ),
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