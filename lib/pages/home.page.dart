import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfaihi_abdesslem_cv/pages/contact.page.dart';
import 'package:sfaihi_abdesslem_cv/pages/pays.page.dart';
import 'package:sfaihi_abdesslem_cv/pages/project_images_page.dart';
import 'package:sfaihi_abdesslem_cv/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/drawer.widget.dart';
import 'package:sfaihi_abdesslem_cv/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  static const String path = "lib/src/pages/home.page.dart";

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.commentDots,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.black54,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(color: Colors.white24),
              child: const Text(
                  "I am Sfaihi Abdesslem, a second-year Software Engineering student. With a passion for innovative problem-solving and a keen eye for detail, I aim to leverage my programming skills to contribute effectively to dynamic projects and teams."),
            ),
            _buildTitleWithIcon("Skills", Icons.star),
            const SizedBox(height: 10.0),
            _buildSkillRow("Angular", 0.75),
            const SizedBox(height: 5.0),
            _buildSkillRow("Laravel", 0.6),
            const SizedBox(height: 5.0),
            _buildSkillRow("React JS", 0.65),
            const SizedBox(height: 5.0),
            _buildSkillRow("Flutter", 0.5),
            const SizedBox(height: 30.0),
            _buildTitleWithIcon("Experience", Icons.work),
            _buildExperienceRow(
              company: "All Soft Multimedia “ASM“",
              position: "Laravel / Angular",
              duration: "2021",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715693690/asm_jewyw9.webp","https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715697081/gestion-deparc-visual-planning_r4xo5o.jpg"],
              context: context,
            ),
            _buildExperienceRow(
              company: "Centres de Carrières et de Certification des Compétences “4C” ",
              position: "Symfony ",
              duration: "2022",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715694035/1_nhlv97.png","https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715697309/Image1_vwl6us.png"],
              context: context,
            ),
            _buildExperienceRow(
              company: "Class Project",
              position: ".Net",
              duration: "2023",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715694628/Image1_ts5i93.png","https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715696438/Image12_jjrsnq.png"],
              context: context,
            ),
            _buildExperienceRow(
              company: "Errors Visualisation PFA",
              position: ".Net",
              duration: "2023",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715695568/t%C3%A9l%C3%A9chargement_afhvzy.png","https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715695488/1_yurain.png","https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715695567/5_rg7a4u.png"],
              context: context,
            ),
            const SizedBox(height: 20.0),
            _buildTitleWithIcon("Etude", Icons.school),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
              company: "Lycée 15 Novembre 1955",
              position: "Baccalauréat Science Experimentales",
              duration: "2016 - 2019",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715691844/7ay_appbre.jpg"],
              context: context,
            ),
            _buildExperienceRow(
              company: "Institut Supérieur d'Informatique et de Multimédia de Sfax",
              position: "Licence Science de l'informatique",
              duration: "2019 - 2022",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715691845/isims_mhgoat.jpg"],
              context: context,
            ),
            _buildExperienceRow(
              company: "Institut International de Technologie",
              position: "Ingénierie en Informatique",
              duration: "2022 - 2025",
              imageUrls: ["https://res.cloudinary.com/dc5wcwmzq/image/upload/v1715691845/iit_hbpxf6.webp"],
              context: context,
            ),
            const SizedBox(height: 20.0),
            _buildContactSection(context), // Move this line to the end of the children list
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitleWithIcon("Contact", Icons.contact_mail),
        const SizedBox(height: 0.0),
        ListTile(
          leading: Icon(
            Icons.mail,
            color: Colors.black54,
          ),
          title: Text(
            "abdesslemsfaihi@gmail.com",
            style: TextStyle(fontSize: 17.0),
          ),
          onTap: () async {
            const emailAddress = 'abdesslemsfaihi@gmail.com';
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: emailAddress,
            );
            if (await canLaunch(emailLaunchUri.toString())) {
              await launch(emailLaunchUri.toString());
            } else {
              throw 'Could not launch $emailLaunchUri';
            }
          },
        ),
        const SizedBox(height: 00.0),
        ListTile(
          leading: Icon(
            Icons.phone,
            color: Colors.black54,
          ),
          title: Text(
            "+216 29348710",
            style: TextStyle(fontSize: 17.0),
          ),
          onTap: () async {
            const phoneNumber = '+21629348710';
            final Uri phoneCallUri = Uri(
              scheme: 'tel',
              path: phoneNumber,
            );
            if (await canLaunch(phoneCallUri.toString())) {
              await launch(phoneCallUri.toString());
            } else {
              throw 'Could not launch $phoneCallUri';
            }
          },
        ),
        _buildSocialsRow(),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10.0),
        const SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.github),
          onPressed: () {
            _launchURL("https://github.com/AbdesslemSfaihi");
          },
        ),
        const SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.linkedin),
          onPressed: () {
            _launchURL(
                "https://www.linkedin.com/in/abdesslem-sfaihi-740b71281/");
          },
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow({
    required String company,
    String? position,
    String? duration,
    required List<String> imageUrls, // Add this parameter for image URL
    required BuildContext context,
  }) {
    return ListTile(
      title: Text(
        company,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("$position ($duration)"),
      onTap: () {
        // Navigate to ProjectImagesPage when an experience is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectImagesPage(
              companyName: company,
              projectDescription: position ?? '',
              imageUrls: imageUrls, // Pass the list of image URLs to ProjectImagesPage
            ),
          ),
        );
      },
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildTitleWithIcon(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Icon(
                iconData,
                color: Colors.black54,
              ),
              SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 30.0),
        SizedBox(
            width: 130.0,
            height: 130.0,
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                    radius: 60.0, backgroundImage: NetworkImage(avatars[7])))),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Abdesslem Sfaihi",
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text("Full Stack Developer", style: TextStyle(fontSize: 16.0),),
            SizedBox(height: 5.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.mapLocationDot,
                    size: 20.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Sfax, Tunisie",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
