import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfaihi_abdesslem_cv/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home.page.dart';
import '../pages/meteo.page.dart';
import '../pages/contact.page.dart';
import '../pages/gallerie.page.dart';
import '../pages/parametres.page.dart';
import '../pages/pays.page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child :const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/home': (context) => HomePage(),
      '/meteo': (context) => MeteoPage(),
      '/contact': (context) => const ContactPage(),
      '/gallerie': (context) => GalleriePage(),
      '/parametres': (context) => const ParametresPage(),
      '/pays': (context) => const MapPage(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {

          return HomePage();
        },
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    ); // MaterialApp
  }
}