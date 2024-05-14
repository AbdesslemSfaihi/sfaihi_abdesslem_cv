import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sfaihi_abdesslem_cv/pages/home.page.dart';
import 'package:sfaihi_abdesslem_cv/theme/theme_provider.dart';
import 'package:sfaihi_abdesslem_cv/animated_background.dart';
import '../pages/home.page.dart';
import '../pages/meteo.page.dart';
import '../pages/contact.page.dart';
import '../pages/gallerie.page.dart';
import '../pages/parametres.page.dart';
import '../pages/pays.page.dart';
import '../pages/project_images_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/home': (context) => HomePage(),
      '/meteo': (context) => MeteoPage(),
      '/contact': (context) => const ContactPage(),
      '/hobby': (context) => HobbiesPage(),
      '/parametres': (context) => const ParametresPage(),
      '/pays': (context) => const MapPage(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
        future: _loadApp(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show the AnimatedBackground with SplashScreen on top
            return AnimatedBackground(
              child: SplashScreen(),
              bubblesCount: 10,
              backgroundColor: Colors.grey,
              bubbleSize: 15,
              bubbleColor: Colors.white10.withOpacity(0.5),
            );
          } else {
            // Once the app has loaded, return a Consumer widget
            return Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => HomePage(),
            );
          }
        },
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );

  }

  Future<void> _loadApp(BuildContext context) async {
    // Add a delay of 3 seconds before completing the Future
    await Future.delayed(const Duration(seconds: 5));
    // Load any initialization tasks here
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Choose your preferred background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to My CV Application",
              style: TextStyle(
                color: Colors.white, // Change the text color to blue
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Change the font family to Roboto
              ),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

