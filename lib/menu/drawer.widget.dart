import 'package:flutter/material.dart';
import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.blue.shade800,
                  Colors.blue.shade200,
                ],
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/profil.jpg'),
                ),
                const SizedBox(height: 20),
                Text(
                  "Sfaihi Abdesslem",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black, // Adjust text color based on mode
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          ...GlobalParams.menus.map((item) {
            return ListTile(
              title: Text(
                item['title'] as String,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black, // Adjust text color based on mode
                ),
              ),
              leading: item['icon'] as Widget, // Use item['icon'] directly
              onTap: () async {
                Navigator.pushNamed(context, item['route'] as String);
              },
            );
          }),
        ],
      ),
    );
  }
}

