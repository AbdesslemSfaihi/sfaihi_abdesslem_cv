import 'package:flutter/material.dart';
import 'gallerie-details.page.dart';

class GalleriePage extends StatelessWidget {
  GalleriePage({Key? key}) : super(key: key);

  final TextEditingController txt_keyword = TextEditingController();

  void _onGetGallerieDetails(BuildContext context) {
    String v = txt_keyword.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GallerieDetails(v),
      ),
    );
    txt_keyword.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallerie'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenue sur la page de Gallerie !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: txt_keyword, // Assign the controller here
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter keyword',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  _onGetGallerieDetails(context);
                },
                child: const Text(
                  'Chercher',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}