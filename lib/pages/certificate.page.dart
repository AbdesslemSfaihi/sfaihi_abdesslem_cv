import 'package:flutter/material.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificates'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CertificateImage(
              imageUrl: 'https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715702194/en_alh20r.png',
              description: 'Certified in English B2 Level',
            ),
            SizedBox(height: 20.0),
            CertificateImage(
              imageUrl: 'https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715702194/robot_yy1p3g.png',
              description: 'Certificate of participation in IIT ROBOTS',
            ),
            SizedBox(height: 20.0),
            CertificateImage(
              imageUrl: 'https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715702088/cm_qsgnkg.png',
              description: 'Certificate of participation in Coding Mania',
            ),
          ],
        ),
      ),
    );
  }
}

class CertificateImage extends StatelessWidget {
  final String imageUrl;
  final String description;

  const CertificateImage({
    required this.imageUrl,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(imageUrl),
        SizedBox(height: 10.0),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),

        Divider(),
      ],
    );
  }
}
