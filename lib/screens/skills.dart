import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_grid.dart';
import 'package:portfolio/data/primary.dart';
import 'package:portfolio/data/types.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  SkillsFormat selectedSkill = SkillsData.skills.first;

  void _setSkill(SkillsFormat skill) {
    this.setState(() {
      selectedSkill = skill;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 110, 0),
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(SkillsData.bg_image), fit: BoxFit.cover, 
              colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), 
              BlendMode.dstATop,
              ),  
          ),
        ),
      child: DefaultTextStyle(
        style: TextStyle(color: SkillsData.fontColor),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // margin: EdgeInsets.all(size.width / 38), // 1920 div 38 ~ 50
          // padding: EdgeInsets.all(15),
          // color: Colors.green,
          alignment: Alignment.topCenter,
          child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of Skills
              ResponsiveGridCol(
                sm: 12,
                lg: 1,
                child: SkillsListView(
                  setSkill: _setSkill,
                  selectedSkill: selectedSkill,
                ),
              ),
              // Details of skills
              ResponsiveGridCol(
                sm: 12,
                lg: 9,
                child: SkillDetailView(
                  selectedSkill: selectedSkill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillDetailView extends StatelessWidget {
  final SkillsFormat selectedSkill;

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : print('Cant launch this url');

  SkillDetailView({required this.selectedSkill});
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 650,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Projects Row Starts
          if (selectedSkill.projects.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        selectedSkill.skillIcon,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(selectedSkill.skillName,
                          style: TextStyle(
                            fontSize: 28,
                            // fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  ResponsiveGridRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...selectedSkill.projects.map(
                          (proj) => ResponsiveGridCol(
                            lg: 6,
                            md: 12,
                            child: InkWell(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gravatar(imageUrl: proj.image!),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              proj.project,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              softWrap: true,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              proj.aboutProject,
                                              //maxLines: 1,
                                              //overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 14),
                                              softWrap: true,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                  proj.duration,
                                                  style: TextStyle(
                                                    //color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                _launchURL(proj.sourceUrl!);
                              },
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

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
          shape: BoxShape.circle,
          color: Colors.green,
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.fitHeight,
            // scale: 100,
          ),
        ));
  }
}

class SkillsListView extends StatelessWidget {
  final Function setSkill;
  final SkillsFormat selectedSkill;

  SkillsListView({required this.setSkill, required this.selectedSkill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: ResponsiveGridRow(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        shrinkChildren: true,
        children: [
          ...SkillsData.skills.map((e) => ResponsiveGridCol(
                lg: 12,
                md: 2,
                sm: 3,
                xs: 3,   
                child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: RawMaterialButton(
                    fillColor: e == selectedSkill
                        ? SkillsData.color
                        : Colors.white,
                    elevation: 0,
                    hoverElevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textStyle: TextStyle(
                      color: e == selectedSkill
                          ? SkillsData.buttonFontColor
                          : SkillsData.fontColor,
                    ),
                    child: Text(e.skillName),
                    onPressed: () {
                      setSkill(e);
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
