import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfaihi_abdesslem_cv/pages/home.page.dart';
import 'package:sfaihi_abdesslem_cv/theme/theme_provider.dart';
import 'package:sfaihi_abdesslem_cv/animated_background.dart';
import '../pages/contact.page.dart';
import '../pages/hobby.page.dart';
import '../pages/parametres.page.dart';
import '../pages/location.page.dart';

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
      '/contact': (context) => const ContactPage(),
      '/hobby': (context) => const HobbiesPage(),
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
            return AnimatedBackground(
              bubblesCount: 10,
              backgroundColor: Colors.grey,
              bubbleSize: 20,
              bubbleColor: Colors.white10.withOpacity(0.5),
              child: const SplashScreen(),
            );
          } else {
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
    await Future.delayed(const Duration(seconds: 5));
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to My CV Application",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
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

