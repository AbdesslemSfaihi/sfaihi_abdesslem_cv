import 'package:flutter/material.dart';

class HobbiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Hobbies'),
      ),
      body: ListView(
        children: <Widget>[
          HobbyCard(
            hobby: 'Sports',
            image: 'images/cal.png',
          ),
          HobbyCard(
            hobby: 'Gaming',
            image: 'images/gaming.png',
          ),
          HobbyCard(
            hobby: 'Music',
            image: 'images/musicc.png',
          ),
        ],
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String hobby;
  final String image;

  HobbyCard({required this.hobby, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(image)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hobby,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
