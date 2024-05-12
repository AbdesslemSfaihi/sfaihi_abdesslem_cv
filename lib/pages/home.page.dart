import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfaihi_abdesslem_cv/pages/contact.page.dart';
import 'package:sfaihi_abdesslem_cv/pages/pays.page.dart';
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
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
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
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
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
                  "Over 8+ years of experience and web development and 5+ years of experience in mobile applications development "),
            ),
            _buildTitle("Skills"),
            const SizedBox(height: 10.0),
            _buildSkillRow("Wordpress", 0.75),
            const SizedBox(height: 5.0),
            _buildSkillRow("Laravel", 0.6),
            const SizedBox(height: 5.0),
            _buildSkillRow("React JS", 0.65),
            const SizedBox(height: 5.0),
            _buildSkillRow("Flutter", 0.5),
            const SizedBox(height: 30.0),
            _buildTitle("Experience"),
            _buildExperienceRow(
                company: "GID Nepal",
                position: "Wordpress Developer",
                duration: "2010 - 2012"),
            _buildExperienceRow(
                company: "Lohani Tech",
                position: "Laravel Developer",
                duration: "2012 - 2015"),
            _buildExperienceRow(
                company: "Popup Bits Pvt. Ltd.",
                position: "Web Developer",
                duration: "2015 - 2018"),
            _buildExperienceRow(
                company: "Popup Bits Pvt. Ltd.",
                position: "Flutter Developer",
                duration: "2018 - Current"),
            const SizedBox(height: 20.0),
            _buildTitle("Etude"),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
                company: "Lycée 15 Novembre 1955",
                position: "(Baccalauréat Science Experimentales",
                duration: "2016 - 2019"),
            _buildExperienceRow(
                company: "Institut Supérieur d'Informatique et de Multimédia de Sfax",
                position: "Licence Science de l'informatique",
                duration: "2019 - 2022"),
            _buildExperienceRow(
                company: "Institut International de Technologie",
                position: "Ingénierie en Informatique",
                duration: "2022 - 2025"),
            const SizedBox(height: 20.0),
            _buildTitle("Contact"),
            const SizedBox(height: 5.0),
            const Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.mail,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  "abdesslemsfaihi@gmail.com",
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  "+216 29348710",
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            _buildSocialsRow(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.facebookF),
          onPressed: () {
            _launchURL("https://facebook.com/Abdesslem Sfaihi");
          },
        ),
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
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
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

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
