import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_grid.dart';
import 'package:portfolio/data/primary.dart';
import 'package:portfolio/data/types.dart';
import 'package:url_launcher/url_launcher.dart';

class Gravatar extends StatelessWidget {
  final String imageUrl;
  const Gravatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            // fit: BoxFit.contain,
            // scale: 1,
          ),
        ));
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        constraints: BoxConstraints(
          minHeight: size.height,
          maxWidth: size.width
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(AboutData.bg_image), fit: BoxFit.cover, 
              colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), 
              BlendMode.dstATop,
              ),  
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.fromLTRB(20, 0, 75, 0),
          child: Column(
            children: [
              HeaderRow(
                icon: Icons.work,
                heading: "Experience",
              ),
              Container(
                child: Row(
                  children: [
                    ...AboutData.experience.map((ex) => 
                            Column(
                              // lg: 3,
                              // md: 4,
                              // sm: 6,
                              children:  [
                                ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                              ]
                            ),
                          ),
                    ...AboutData.experience4.map((ex) => 
                            Column(
                              children:  [  
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
               Container(
                child: Row(
                  children: [
                    ...AboutData.experience2.map((ex) => 
                            Column(
                              children:  [  
                                ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                              ]
                            ),
                          ),
                    ...AboutData.experience5.map((ex) => 
                            Column(
                              children:  [  
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
              Container(
                child: Row(
                  children: [
                    ...AboutData.experience3.map((ex) => 
                            Column(
                              children:  [  
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
              HeaderRow(
                icon: Icons.school,
                heading: "Education",
              ),
              Container(
                child: Row(
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
        // height: 275,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.all(10),
        // padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
        decoration: BoxDecoration(
            color: data.color,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Gravatar(imageUrl: data.image!),
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
                      fontSize: 20,
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
                      fontSize: 15),
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
                      fontSize: 13),
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
        width: 850,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: exp.bgcolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: exp.altcolor,
                width: 10,
              ),
              SizedBox(
                width: 10,
              ),
              DefaultTextStyle(
                style: TextStyle(color: exp.color),
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
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.jobTitle,
                          style: TextStyle(
                              color: exp.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
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
            size: 35,
          ),
          SizedBox(
            width: 20,
          ),
          //DecoratedBox(decoration: Decoration(),child: SizedBox(),)
          Text(
            this.heading.toUpperCase(),
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
