import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfaihi_abdesslem_cv/theme/theme_provider.dart';

import '../theme/theme.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dark Mode',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) => GestureDetector(
                  onTap: () {
                    final newTheme = themeProvider.themeData == darkMode ? lightMode : darkMode;
                    themeProvider.themeData = newTheme;
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: themeProvider.themeData == darkMode ? Colors.grey[700] : Colors.grey[300],
                      border: Border.all(color: Colors.grey[600]!),
                    ),
                    alignment: themeProvider.themeData == darkMode ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
