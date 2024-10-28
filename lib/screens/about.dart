import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive_grid.dart';
import 'package:portfolio/data/primary.dart';
import 'package:portfolio/data/types.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:responsive_framework/responsive_row_column.dart';
// import 'package:responsive_framework/responsive_wrapper.dart';

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
          // gradient: LinearGradient(colors: [
          //   Colors.black,
          //   Colors.black54
          //   // Color(0xFF090654),
          //   // Color(0xFF2D0E41),
          //   // Color(0xFF441333),
          //   // Color(0xFF77262A),
          // ]),
          //  color: Color(0xFF090654),
        ),
        child: Container(
          // color: Color.fromARGB(225, 33, 0, 31),
          // padding: EdgeInsets.only(top: 5, left: 10, right: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          // alignment: Alignment.center,
          child: Column(
            children: [
              HeaderRow(
                icon: Icons.work,
                heading: "Experience",
              ),
              Container(
                child: ResponsiveGridRow(
                  children: [
                    ...AboutData.experience.map((ex) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 3,
                              sm: 4,
                              child:  ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                            ),
                          ),
                    ...AboutData.experience4.map((ex) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 3,
                              sm: 4,
                              child:  ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                            ),
                          ),
                  ],
                ),
              ),
               Container(
                child: ResponsiveGridRow(
                  children: [
                    ...AboutData.experience2.map((ex) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 3,
                              sm: 4,
                              child:  ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                            ),
                          ),
                    ...AboutData.experience5.map((ex) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 3,
                              sm: 4,
                              child:  ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                child: ResponsiveGridRow(
                  children: [
                    ...AboutData.experience3.map((ex) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 3,
                              sm: 4,
                              child:  ExperienceTile(
                                  size: size,
                                  exp: ex,
                                ),
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
                // margin: EdgeInsets.only(
                //   top: 1,
                // ),
                // child: ResponsiveRowColumn(
                //   rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   rowCrossAxisAlignment: CrossAxisAlignment.start,
                //   rowColumn:
                //       !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
                //   children: [
                //     ...AboutData.education.map((ed) => ResponsiveRowColumnItem(
                //           child: EducationTIle(),
                //         )),
                //   ],
                // ),
                child: ResponsiveGridRow(
                  // rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // rowCrossAxisAlignment: CrossAxisAlignment.start,
                  // rowColumn:
                  //     !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
                  // rowSegments: 4,

                  children: [
                    ...AboutData.education.map((ed) => 
                            ResponsiveGridCol(
                              lg: 3,
                              md: 4,
                              sm: 6,
                              child: EducationTIle(data: ed,),
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

class EducationTIle extends StatelessWidget {
  const EducationTIle({
    Key? key,
    required this.data,
  }) : super(key: key);

  final EducationData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 275,
      //height: 275,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal :10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: data.color,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
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
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(
            maxWidth: size.width / (AboutData.experience.length + 1)
            ),
        // width: 275,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: exp.color,
                width: 10,
                //height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              DefaultTextStyle(
                style: TextStyle(color: Colors.black),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.organisation,
                          style: TextStyle(
                              color: exp.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.jobTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 400,
                        color: exp.color,
                        // constraints: BoxConstraints(maxWidth: exp.info.split('\n').fold(0, (len, element) => 
                        //   element.length*7 > len ? element.length.toDouble()*7 : len
                        //   // if(element.length > len){
                        //   //   element.length.toDouble(),
                        //   // }else{
                        //   //   len
                        //   // }
                        // )),
                      ),
                      //if(exp.info != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          exp.info,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        exp.timeSpan,
                        style: TextStyle(color: exp.color),
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
