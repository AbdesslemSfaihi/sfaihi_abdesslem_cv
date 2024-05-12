import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  String ville;

  MeteoDetailsPage(this.ville, {super.key});

  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Meteo Details ${widget.ville}'),
      ),
      body: meteoData == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: meteoData['list'].length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt']*1000000)),style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text(
                          "${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))} | ${meteoData['list'][index]['weather'][0]['main'].toString()}",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${(meteoData['list'][index]['main']['temp'] - 273.15).round()}°C",style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void getMeteoData(String ville) {
    print("Meteo de la ville de $ville");
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$ville&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        meteoData = json.decode(resp.body);
      });
    }).catchError((err) {
      print(err);
    });
  }
}
//map box