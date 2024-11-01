import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/types.dart';

const data = <dynamic, dynamic>{
  "AppTitle": "Vincent Itucal",
};

class HomeData {
  static const greeting = "Hello!";
  static const intro = "I'm Vincent Itucal";
  static const profile = """A Physicist with Data Science and Software Engineering training with a background in Data Platforms,
Trading Systems, Pension Systems and Cryptocurrencies.""";
  static const bg_image = "assets/images/work_banner.png";
  // static const user_image = "assets/images/man.png";
  static const user_image = "https://avatars.githubusercontent.com/u/99640086";
}

class AboutData {
  static const bg_image = "assets/images/dragon.jfif";
  static const screenTitle = "About";
  static const about_summary =
      """x""";
  static const List<ExperienceData> experience = [
    const ExperienceData(
      organisation: "Philippine Digital Asset Exchange (PDAX)",
      jobTitle: "Software Engineer",
      timeSpan: "Aug 2024 - Present",
      info: """Crypto as a Service (CaaS)
\u2022 Led a data warehousing project that leveraged big data technologies to cut report generation time from hours to minutes, enabling seamless integration with Data Science, AI, and Analytics. Recently integrated the data warehouse with Metabase, a business intelligence tool to create dashboards supporting different business units\n""",
      color: Colors.black,
    ),
  ];

  static const List<ExperienceData> experience2 = [
    const ExperienceData(
      organisation: "Security Bank Corporation",
      jobTitle: "Software Engineer",
      timeSpan: "Apr 2023 - Aug 2024",
      info: """Regulatory Reports
\u2022 Led a team of data engineers in creating a data pipeline for BSP Regulatory Reports
Cloud Data Platform (CDP)
\u2022 Helped Migrate on-prem data architecture of the bank to the cloud\n\n\n\n""",
      color: Colors.black,
    ),
  ];

  static const List<ExperienceData> experience3 = [
    const ExperienceData(
      organisation: "Philippine Digital Asset Exchange (PDAX)",
      jobTitle: "Tech Lead/Software Engineer",
      timeSpan: "Feb 2022 - Mar 2023",
      info: """Crypto as a Service (CaaS)
\u2022 Led a team of software engineers that provided cryptocurrency platform capabilities to partners via API
microservices. GCrypto under GCash is one of the products deployed in less than 6 months of development\n""",
      color: Colors.black,
    ),
  ];

  static const List<ExperienceData> experience4 = [
    const ExperienceData(
      organisation: "Accenture Philippines",
      jobTitle: "Software Engineer",
      timeSpan: "Jul 2021 - Feb 2022",
      info: """Pension System
\u2022 Helped in the development, implementation and modernization of a pension system for a Southeast Asian\nGovernment.\n\n""",
      color: Colors.black,
    ),
  ];

  static const List<ExperienceData> experience5 = [
    const ExperienceData(
      organisation: "Chi-X Global Technology (Philippines) Inc",
      jobTitle: "Software Developer",
      timeSpan: "Sep 2019 - Jul 2021",
      info: """Smart Order Router (SOR) / Best Execution Router (BER)
\u2022 Developed and implemented Smart Order Router - a system that manages orders for best execution sent in
the different market venues available to the Chi-X Trading System.
Fee Engine
\u2022 Helped in development and testing of Fee engine - an engine which calculates the trading fees for the client.
Fees are calculated based on what market index the stock belongs to (e.g. TOPIX 500, Nikkei 225, etc), what
market venue the executions are traded on, and whether the client is a market taker or a maker.\n""",
      color: Colors.black,
    ),
  ];

  static const List<EducationData> education = [
    const EducationData(
      degree: "Master of Science in Data Science (MSDS)",
      college: "Asian Institute of Management\nMakati",
      timeSpan: "2023 - 2025",
      color: Colors.black,
      fontColor: Colors.white,
    ),
    const EducationData(
      degree: "Bachelor of Science in Applied Physics",
      college: """University of the Philippines Manila\n""",
      timeSpan: "2013 - 2019",
      color: Colors.black,
      fontColor: Colors.white,
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
        skillName: "Portfolio",
        skillIcon: Icons.developer_board_outlined,
        experienceTimeWithSkill: "",
        details:
            """x""",
        certifications: [],
        projects: [
          const ProjectsData(
            project: "Which mainstream cryptocurrency is best for your needs?",
            duration: "(AIM-MSDS) Big Data And Cloud Computing - Laboratory Report",
            aboutProject:
                """Leveraged big data technologies to analyze Bitcoin and Ethereum use cases and performance metrics, optimizing cryptocurrency decision-making based on transaction efficiency, costs, and utility""",
            image: "assets/images/others/github.png",
            sourceUrl: "https://github.com/vsitucal-personal/bdcc_lab",
          ),
          const ProjectsData(
            project: "Smart Pricing: Machine Learning and SHAP for Option Valuation",
            duration: "(AIM-MSDS) Machine Learning 2 - Final Project",
            aboutProject:
                """Used popular Machine Learning models to predict last traded prices of US options and used Black-Scholes-Merton traditional pricing model as a baseline for comparison""",
            image: "assets/images/others/github.png",
            sourceUrl: "https://github.com/vsitucal-personal/ml2_final_project",
          ),
          const ProjectsData(
            project: "Hiring Detective: Unmasking Key Patterns in LinkedIn Job Postings with Frequent Itemset Mining (FIM)",
            duration: "(AIM-MSDS) Data Mining and Wrangling 2 - Final Project",
            aboutProject:
                """Used Frequent Itemset Mining (FIM) to recommend job skills that are often seen together to increase a job candidate's hirability.""",
            image: "assets/images/others/github.png",
            sourceUrl: "https://github.com/vsitucal-personal/DMW2_Final",
          ),
          const ProjectsData(
            project: "Feature Analysis on the London Fire Brigade through Clustering",
            duration: "(AIM-MSDS) Data Mining and Wrangling 2 - Laboratory Project on Clustering Methods",
            aboutProject:
                """Used Representative Based, Agglomerative and Density Based clustering to assess and highlight inefficiencies in the handling of fire events by the London Fire Brigade""",
            image: "assets/images/others/github.png",
            sourceUrl: "https://github.com/vsitucal-personal/London_Fire_Brigade_MSDS2025A_DMW2_LAB_LT5",
          ),
        ]),
    const SkillsFormat(
        skillName: "Publications",
         skillIcon: Icons.book,
        experienceTimeWithSkill: "",
        details:
            """x""",
        certifications: [],
        projects: [
          const ProjectsData(
            project: "Monte Carlo simulation of photon specific absorbed fractions for internal self-dosimetry of the thyroid based on a Filipino model",
            duration: "Proceedings of the Samahang Pisika ng Pilipinas",
            aboutProject:
                """Used MCNP - a general-purpose transport code of many elementary particles to simulate dosage received in human phantoms and created a model phantom catered to Filipino measurements.""",
            image: "assets/images/others/spp.jpeg",
            sourceUrl: "https://proceedings.spp-online.org/article/view/SPP-2019-3D-01",
          ),
        ]),
    const SkillsFormat(
        skillName: "Blog",
        skillIcon: Icons.web_stories_outlined,
        experienceTimeWithSkill: "",
        details:
            """x""",
        certifications: [],
        
        projects: [
          const ProjectsData(
            project: "(2024) AWS EMR Guide",
            duration: "",
            aboutProject:
                """Guide on setting up AWS EMR""",
            image: "assets/images/others/medium.png",
            sourceUrl: "https://medium.com/@vsitucal/2024-aws-emr-guide-4fb5adf2c6f3?source=friends_link&sk=05506efda866fe8ac83697e2b8599ed5",
          ),
          const ProjectsData(
            project: "(2024) Jupyter Lab with PySpark hosted in AWS EC2",
            duration: "",
            aboutProject:
                """Guide on hosting Jupyter Lab in AWS EC2""",
            image: "assets/images/others/medium.png",
            sourceUrl: "https://medium.com/@vsitucal/2024-jupyter-lab-with-pyspark-hosted-in-aws-ec2-03509f72f3bd?source=friends_link&sk=f131d396b8850ea9d2864fe26b263854",
          ),
          const ProjectsData(
            project: "Introduction to Geopandas using PH GADM and OSM shape files",
            duration: "",
            aboutProject:
                """Guide on Geopandas, GADM and OSM""",
            image: "assets/images/others/medium.png",
            sourceUrl: "https://medium.com/@vsitucal/introduction-to-geopandas-using-ph-gadm-and-osm-shape-files-dc5529a8f102?source=friends_link&sk=b7e1884b919bb2b05e31dc9ba6f809c1",
          ),
          const ProjectsData(
            project: "“Data Strategy in Modern Business: A Personal Weltanschauung”",
            duration: "",
            aboutProject:
                """Data Science and AI Ethics blog""",
            image: "assets/images/others/medium.png",
            sourceUrl: "https://medium.com/@vsitucal/data-strategy-in-modern-business-a-personal-weltanschauung-7ab908528cb8?source=friends_link&sk=ae84fe94fc148b420199fd7452169dd4",
          ),
        ]),
  ];
}

class AdvertData {
  static const bg_image = "assets/images/tiger.jfif";
  static const gcash = "assets/images/gcash.png";
  static const List<ContactClass> contacts = [
    const ContactClass(
      contactName: "Send some donation my way and advertise your brands here!",
      icon: FontAwesomeIcons.bullhorn,
      url: "mailto:vsitucal@gmail.com",
      iconColor: Colors.white,
      bgColor: Colors.black,
      textColor: Colors.white,
    ),
  ];
} 


class ContactData {
  static const bg_image = "assets/images/seadragon.jfif";
  static const gcash = "assets/images/gcash.png";
  static const List<ContactClass> contacts = [
    const ContactClass(
      contactName: "My Resume",
      icon: FontAwesomeIcons.filePdf,
      url: "https://s3.ap-southeast-1.amazonaws.com/vitucal.com/Latest_Vitucal_Resume.pdf",
      iconColor: Colors.white,
      bgColor: Colors.green,
      textColor: Colors.white,
    ),
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
