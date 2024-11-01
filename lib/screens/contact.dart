import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/responsive_grid.dart';
import 'package:portfolio/data/primary.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String selected = ContactData.selectedContact.first;

  void _setContact(String about) {
    this.setState(() {
      selected = about;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
      // constraints: BoxConstraints(
      //   minHeight: size.height,
      // ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ContactData.bg_image), fit: BoxFit.cover, 
              colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), 
              BlendMode.dstATop,
              ),  
          ),
        ),
      child: DefaultTextStyle(
        style: TextStyle(color: SkillsData.fontColor),
        child: Container(
          // margin: EdgeInsets.all(size.width / 38), // 1920 div 38 ~ 50
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // padding: EdgeInsets.all(15),
          // color: Colors.white70,
          alignment: Alignment.topCenter,
          child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of Skills
              ResponsiveGridCol(
                sm: 12,
                lg: 1,
                child: ContactListView(
                  setContact: _setContact,
                  selected: selected,
                ),
              ),
              // Details of skills
              ResponsiveGridCol(
                sm: 12,
                lg: 9,
                child: StatelesContactScreen(
                  selected: selected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactListView extends StatelessWidget {
  final Function setContact;
  final String selected;

  ContactListView({required this.setContact, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: ResponsiveGridRow(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        shrinkChildren: true,
        children: [
          ...ContactData.selectedContact.map((e) => ResponsiveGridCol(
                lg: 12,
                md: 2,
                sm: 3,
                xs: 3,
                //margin: EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.center,
                  child: RawMaterialButton(
                    fillColor: e == selected
                        ? ContactData.color
                        : Colors.white,
                    elevation: 0,
                    hoverElevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: TextStyle(
                      color: e == selected
                          ? ContactData.buttonFontColor
                          : ContactData.fontColor,
                    ),
                    child: Text(e),
                    onPressed: () {
                      setContact(e);
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


class StatelesContactScreen extends StatelessWidget {
  final String selected;

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : print('Cant launch $_url');

  StatelesContactScreen({required this.selected});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: NetworkImage(
      //         ContactData.bg_image), fit: BoxFit.cover,
      //         colorFilter: ColorFilter.mode(
      //         Colors.black.withOpacity(0.2), 
      //         BlendMode.dstATop,             
      //       ),
      //       ),
            
      // ),
      child: Container(
        //alignment: Alignment.sta,
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        padding: EdgeInsets.all(15),
        //color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (this.selected == "Contact") ...[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Contact",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
              ResponsiveGridRow(
                shrinkChildren: true,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...ContactData.contacts.map((contact) => ResponsiveGridCol(
                        xs: 6,
                        sm: 4,
                        md: 3,
                        lg: 2,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: RawMaterialButton(
                            fillColor: contact.bgColor,
                            hoverColor: contact.bgColor,
                            elevation: 10,
                            hoverElevation: 15,
                            animationDuration: Duration(milliseconds: 200),
                            padding: EdgeInsets.all(10),
                            onPressed: () {
                              _launchURL(contact.url);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    contact.icon,
                                    size: 50,
                                    color: contact.iconColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    contact.contactName,
                                    style: TextStyle(
                                        color: contact.textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
            if (this.selected == "Donate") ...[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Donate (G-Cash)",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 330, // Set the width of the container
                  height: 330,
                  child: Image.network(ContactData.gcash, fit: BoxFit.fitHeight),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
