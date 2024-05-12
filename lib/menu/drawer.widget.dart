import 'package:flutter/material.dart';
import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey,
                  Colors.lightBlue,
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profil.jpg'),
                  ),
                  SizedBox(height: 10,),
                  Text("Sfaihi Abdesslem",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
          ),
          ...(GlobalParams.menus).map((item) {
            return ListTile(
              title: Text(item['title'] as String),
              leading: item['icon'] as Icon,
              onTap: () async {
                  Navigator.pushNamed(context, item['route'] as String);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
