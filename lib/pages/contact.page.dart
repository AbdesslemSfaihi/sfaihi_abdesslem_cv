import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  // Function to launch the default messaging app with a pre-filled message
  void _sendDirectMessage(BuildContext context) async {
    const phoneNumber = '+21629348710'; // Your phone number
    const message = 'Hello, I am contacting you through the app.'; // Pre-filled message
    final Uri messageUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );
    if (await canLaunch(messageUri.toString())) {
      await launch(messageUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not send message'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final buttonColor = isDarkMode ? Colors.white : Colors.black;
    final buttonTextColor = isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Contact Page !'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sendDirectMessage(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: buttonTextColor, backgroundColor: buttonColor,
              ),
              child: const Text('Send me a message'),
            ),
          ],
        ),
      ),
    );
  }
}
