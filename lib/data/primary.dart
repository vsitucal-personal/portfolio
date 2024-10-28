import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/types.dart';

const data = <dynamic, dynamic>{
  "AppTitle": "Vincent Itucal",
};

class HomeData {
  static const greeting = "Hello!";
  static const intro = "I am Vincent Itucal";
  static const profile = """A Physicist with Data Science and Software Engineering training with a background in Data Platforms,
Trading Systems, Pension Systems and Cryptocurrencies.""";
  static const bg_image = "assets/images/work_banner.png";
  // static const user_image = "assets/images/man.png";
  static const user_image = "https://avatars.githubusercontent.com/u/99640086";
}

class AboutData {
  static const bg_image = "assets/images/2about.webp";
  static const screenTitle = "About";
  static const about_summary =
      """x""";
  static const List<ExperienceData> experience = [
    const ExperienceData(
      organisation: "Tech Mahindra",
      jobTitle: "Software Engineer Developer",
      timeSpan: "July 2019 - present",
      info: """\u2022 Understand requirements and develop prototypes.
\u2022 Develop Frontend of Web-applications with angular,js
\u2022 Develop Backend of Web applications with c# asp.net and MSSQL server.
\u2022 Automate Tasks with python.
\u2022 Refactor codebase for better maintainability and performance""",
      color: Colors.black,
    ),
  ];

  static const List<EducationData> education = [
    const EducationData(
      degree: "Master of Computer Applications",
      college: "Indira Gandhi National Open University\nDelhi",
      timeSpan: "July 19 - August 22",
      color: Colors.indigo,
      fontColor: Colors.white,
    ),
    const EducationData(
      degree: "Bachelor of Computer Science",
      college: """Bhaskaracharya College Of Applied Sciences
Delhi University""",
      timeSpan: "July 16- May 19",
      color: Colors.amber,
      fontColor: Colors.black87,
    ),
    const EducationData(
      degree: "XII (Science)",
      college: """Rajkiya Pratibha Vikas Vidhyalaya
Dwarka, Delhi""",
      timeSpan: "2016",
    ),
  ];
}

class SkillsData {
  static const bg_image = "assets/images/3showcase.webp";
  static const list_title = "skills";
  static const color = Colors.pink;
  static const secondaryButtonColor = Colors.blueGrey;
  static const fontColor = Colors.black;
  static const buttonFontColor = Colors.white;
  static const List<SkillsFormat> skills = [
    const SkillsFormat(
        skillName: "Python",
        experienceTimeWithSkill: "4+ years",
        details:
            """"Python is one of my favourite languages. It is my go to language to solve any problem with scriptable solution. Apart form using it to script almost every small problem, I have worked on few of my personal python projects that are a bit larger in scale,
Professionally I have used python for automating tasks of operations teams at Tech Mahindra.""",
        certifications: [],
        projects: [
          const ProjectsData(
            project: "Python On Pails",
            duration: "2018 - Current",
            aboutProject:
                """Python On Pails is an OpenSource lightweight web development framework that is designed to speed up development process.""",
            image: "assets/images/others/pyop.webp",
            sourceUrl: "https://github.com/tg21/python-on-pails",
          ),
          const ProjectsData(
            project: "WiBuster",
            duration: "2018 - Current",
            aboutProject:
                "WiBuster is an opesource website enumerator made with python3. It can enumerate even those websites that respond with code 200 even when resource is not present",
            image: "assets/images/others/wibuster.webp",
            sourceUrl: "https://github.com/tg21/wibuster",
          ),
        ]),
  ];
}

class ContactData {
  static const bg_image = "assets/images/seadragon.jfif";
  static const gcash = "assets/images/gcash.png";
  static const List<ContactClass> contacts = [
    const ContactClass(
      contactName: "Gmail",
      icon: FontAwesomeIcons.solidEnvelope,
      url: "mailto:vsitucal@gmail.com",
      iconColor: Colors.white,
      bgColor: Colors.red,
      textColor: Colors.white,
    ),
    const ContactClass(
      contactName: "LinkedIn",
      icon: FontAwesomeIcons.linkedin,
      url: "https://www.linkedin.com/in/vitucal/",
      iconColor: Colors.white,
      bgColor: Colors.indigo,
      textColor: Colors.white,
    ),
    const ContactClass(
      contactName: "GitHub",
      icon: FontAwesomeIcons.github,
      url: "https://github.com/vsitucal-personal",
      iconColor: Colors.white,
      textColor: Colors.white,
      bgColor: Colors.deepPurple,
    ),
    const ContactClass(
      contactName: "Medium",
      icon: FontAwesomeIcons.medium,
      url: "https://medium.com/@vsitucal",
      iconColor: Colors.white,
      textColor: Colors.white,
      bgColor: Colors.black,
    ),
  ];
}

class BlogData {
  static const bg_image = "assets/images/5litrature.webp";
  static const primaryColor = Colors.yellow;
  static const List<BlogClass> blogList = [
    const BlogClass(
        name: "How To Fix a bulb without moving a muscle 💡",
        url: "https://google.com",
        details: """When the exception was thrown, this was the stack
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 236:49      throw_
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3        assertFailed
packages/flutter/src/widgets/container.dart 274:42                                                                             new
packages/portfolio/screens/blog.dart 62:32"""),
    const BlogClass(
        name: "Why reddit is the worst platform for anything",
        url: "https://reddit.com",
        bgColor: Colors.green,
        textColor: Colors.white,
        details: """When the exception was thrown, this was the stack
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 236:49      throw_
C:/b/s/w/ir/cache/builder/src/out/host_debug/dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 29:3        assertFailed
packages/flutter/src/widgets/container.dart 274:42                                                                             new
packages/portfolio/screens/blog.dart 62:32"""),
  ];
}

class ArtData {
  static const bg_image = 'assets/images/4art.webp';
  static const List<String> photos = [
    'assets/images/art/art1.webp',
    'assets/images/art/art2.webp',
    'assets/images/art/art3.webp',
    'assets/images/art/art4.webp',
    'assets/images/art/art5.webp',
    'assets/images/art/art6.webp',
  ];
}
