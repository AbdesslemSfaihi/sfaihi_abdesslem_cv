class ProjectUtils {
  final String image;
  final Map<String, String> title;
  final Map<String, String> subtitle;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/ecommerce.jpg',
      title: {
        'en':'Online Shop Web App',
        'fr':'Application Web de boutique en ligne',
      },
      subtitle:{
        'en':'This is a responsive online shop web application for fashion ',
        'fr':'Il s agit d une application Web de boutique en ligne réactive pour la mode',

      },
      webLink:
      'https://github.com/youssefkoubaa/E_commerce'
  ),
  ProjectUtils(
    image: 'assets/projects/cv.jpg',
    title: {
      'en':'Cv portfolio',
      'fr':"Cv portfolio",
    },
    subtitle:{
      'en':"My digital resume highlights my skills, experiences and achievements in a professional and engaging way.",
      'fr': "Mon CV numérique met en lumière mes compétences, expériences et réalisations de manière professionnelle et attrayante.",

    },
    webLink: 'https://github.com/youssefkoubaa/cv',
  ),

  ProjectUtils(
    image: 'assets/projects/fastfood.jpg',
    title: {
      'en':'FastFood',
      'fr':"FastFood",
    },
    subtitle:{
      'en': "FastFood: Quickly order your favorite dishes in an instant!",
      'fr': "FastFood : Commandez rapidement vos plats préférés en un instant!",

    },
    webLink: 'https://github.com/youssefkoubaa/FastFood1/tree/master/FastFood',
  ),

];