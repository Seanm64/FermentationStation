import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: const Icon(Icons.wine_bar_outlined),
            title: const Text('Make A Brew'),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              Navigator.pushNamed(context, '/addBrew');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuration'),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              Navigator.pushNamed(context, '/config');
            },
          ),
        ],
      ),
    );
  }
}
