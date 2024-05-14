import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Home",
      "icon": const Icon(
        Icons.home_filled,
        color: Colors.indigo,
      ),
      "route": "/home"
    },
    {
      "title": "Hobbies",
      "icon": const Icon(
        Icons.sports_esports_rounded,
        color: Colors.indigo,
      ),
      "route": "/hobby"
    },
    {
      "title": "My Location",
      "icon": const Icon(
        Icons.maps_home_work_rounded,
        color: Colors.indigo,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": const Icon(
        Icons.contact_page_rounded,
        color: Colors.indigo,
      ),
      "route": "/contact"
    },
    {
      "title": "Paramètres",
      "icon": const Icon(
        Icons.settings,
        color: Colors.indigo,
      ),
      "route": "/parametres"
    },
  ];

  static List<Map<String, dynamic>> accueil = [
    {"title": "images/gallerie.png", "route": "/gallerie"},
    {"title": "images/pays.png", "route": "/pays"},
    {"title": "images/contact.png", "route": "/contact"},
    {"title": "images/parametres.png", "route": "/parametres"},
  ];
}