import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectImagesPage extends StatelessWidget {
  final String companyName;
  final String projectDescription;
  final List<String> imageUrls; // Add imageUrl as a field

  ProjectImagesPage({
    required this.companyName,
    required this.projectDescription,
    required this.imageUrls, // Add imageUrl to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            '$projectDescription',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Use CarouselSlider to display images in a carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 300, // Adjust height to fit the images properly
              aspectRatio: 16 / 9, // Adjust aspect ratio as per your images
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain, // Adjust BoxFit as per your requirement
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Change the button's background color
              onPrimary: Colors.white, // Change the button's text color
            ),
            child: Text(
              'Back to Home',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
