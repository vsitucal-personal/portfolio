import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/screens/advert.dart';
import 'package:portfolio/screens/contact.dart';

import 'package:portfolio/screens/home.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/skills.dart';

class ScreenData {
  final IconData icon;
  final String tooltip;
  final Widget widget;
  final Color primaryColor;

  ScreenData(
      {required this.icon,
      required this.tooltip,
      required this.widget,
      required this.primaryColor});
}

//mainly data for actionbar
var screensData = [
  ScreenData(
    icon: FontAwesomeIcons.fortAwesome,
    tooltip: "Home",
    widget: HomeScreen(),
    primaryColor: Colors.white,
  ),
  ScreenData(
    icon: FontAwesomeIcons.solidUser,
    tooltip: "About",
    widget: AboutScreen(),
    primaryColor: Colors.red,
  ),

  ScreenData(
    icon: FontAwesomeIcons.solidFileCode,
    tooltip: "Skills",
    widget: SkillScreen(),
    primaryColor: Colors.green,
  ),
  ScreenData(
    icon: FontAwesomeIcons.solidIdCard,
    tooltip: "contact",
    widget: ContactScreen(),
    primaryColor: Colors.blue,
  ),
  ScreenData(
    icon: FontAwesomeIcons.bullhorn,
    tooltip: "Advertise",
    widget: AdvertScreen(),
    primaryColor: Colors.black,
  ),
];
