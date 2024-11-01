import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_grid.dart';
import 'package:portfolio/data/primary.dart';
import 'package:portfolio/data/types.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Gravatar extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const Gravatar({
    Key? key, required this.imageUrl, 
    this.height = 120, this.width = 180
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height:this.height,
        margin: EdgeInsets.all(10),      
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.contain,
          ),
        )
    );
  }
}

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String selected = AboutData.selectedAbout.first;

  void _setAbout(String about) {
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
              image: NetworkImage(AboutData.bg_image), fit: BoxFit.cover, 
              colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), 
              BlendMode.dstATop,
              ),  
          ),
        ),
      child: DefaultTextStyle(
        style: TextStyle(color: AboutData.fontColor),
        child: Container(
          // margin: EdgeInsets.all(size.width / 38), // 1920 div 38 ~ 50
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // padding: EdgeInsets.all(15),
          // color: Colors.white70,
          alignment: Alignment.topCenter,
          child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveGridCol(
                sm: 12,
                lg: 1,
                child: AboutListView(
                  setAbout: _setAbout,
                  selected: selected,
                ),
              ),
              ResponsiveGridCol(
                sm: 12,
                lg: 9,
                child: StatelessAboutScreen(
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

class AboutListView extends StatelessWidget {
  final Function setAbout;
  final String selected;

  AboutListView({required this.setAbout, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: ResponsiveGridRow(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        shrinkChildren: true,
        children: [
          ...AboutData.selectedAbout.map((e) => ResponsiveGridCol(
                lg: 12,
                md: 2,
                sm: 3,
                xs: 3,
                //margin: EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.center,
                  child: RawMaterialButton(
                    fillColor: e == selected
                        ? AboutData.color
                        : Colors.white,
                    elevation: 0,
                    hoverElevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: TextStyle(
                      color: e == selected
                          ? AboutData.buttonFontColor
                          : AboutData.fontColor,
                    ),
                    child: Text(e),
                    onPressed: () {
                      setAbout(e);
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class StatelessAboutScreen extends StatelessWidget {
  final String selected;

  StatelessAboutScreen({required this.selected});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        constraints: BoxConstraints(
          minHeight: size.height,
          maxWidth: size.width
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.fromLTRB(20, 0, 75, 0),
          child: Column(
            children: [
              if (this.selected == "Experience") ...[
                HeaderRow(
                  icon: Icons.work,
                  heading: "Experience",
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      ...AboutData.experience.map((ex) => 
                              Column(
                                children: [
                                  ExperienceTile(
                                    size: size,
                                    exp: ex,
                                  ),
                                ]
                              ),
                            ),
                    ],
                  ),
                ),
              ],
              if (this.selected == "Education") ...[
                HeaderRow(
                  icon: Icons.school,
                  heading: "Education",
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      ...AboutData.education.map((ed) => 
                              Column(
                                children: [
                                  EducationTile(data: ed,),
                                ]
                              ),
                            ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class EducationTile extends StatelessWidget {
  const EducationTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : print('Cant launch this url');

  final EducationData data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchURL(data.url); // Replace with your function or action
      },
      child: Container(
        width: 850,
        // height: 300,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        // padding: EdgeInsets.all(10),
        // padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
        decoration: BoxDecoration(
            color: data.color,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Gravatar(imageUrl: data.image!),
            Container(
                color: data.fontColor,
                width: 2,
                height: 120,
            ),
            SizedBox(
                width: 2,
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Text(
                  data.degree,
                  style: TextStyle(
                      color: data.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      ),
                      softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.college,
                  style: TextStyle(
                      color: data.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                      softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.timeSpan,
                  style: TextStyle(
                      color: data.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                      softWrap: true,
                ),
              ),
            ],
          ),
          ]
        )
      )
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final ExperienceData exp;
  const ExperienceTile({
    Key? key,
    required this.size,
    required this.exp,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 750,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: exp.bgcolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gravatar(imageUrl: exp.image!, height: 100, width: 100,),
              Container(
                color: exp.altcolor,
                width: 2,
              ),
              SizedBox(
                width: 10,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: exp.color,
                  fontSize: 12,
                ),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.organisation,
                          style: TextStyle(
                              color: exp.altcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.jobTitle,
                          style: TextStyle(
                              color: exp.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 700,
                        color: exp.altcolor,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        width: 700,
                        child: Text(
                          exp.info,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        exp.timeSpan,
                        style: TextStyle(color: exp.altcolor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class HeaderRow extends StatelessWidget {
  final IconData icon;
  final String heading;
  const HeaderRow({Key? key, required this.icon, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        //Page Title
        children: [
          Icon(
            this.icon,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            this.heading.toUpperCase(),
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
