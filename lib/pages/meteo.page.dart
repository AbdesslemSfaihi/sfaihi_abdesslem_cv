import 'package:flutter/material.dart';
import 'meteo-details.page.dart';

class MeteoPage extends StatelessWidget {
  MeteoPage({Key? key}) : super(key: key);

  final TextEditingController txt_ville = TextEditingController();

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MeteoDetailsPage(v)));
    txt_ville.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Météo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenue sur la page Météo !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: txt_ville, // Assign the controller here
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter city name',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  _onGetMeteoDetails(context);
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
