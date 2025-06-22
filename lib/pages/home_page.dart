import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/constants/size.dart';
import 'package:my_web_portfolio/constants/skill_items.dart';
import 'package:my_web_portfolio/widget/drawer_mobile.dart';
import 'package:my_web_portfolio/widget/header_desktop.dart';
import 'package:my_web_portfolio/widget/header_mobile.dart';
import 'package:my_web_portfolio/widget/main_desktop.dart';
import 'package:my_web_portfolio/widget/main_mobile.dart';
import 'package:my_web_portfolio/widget/skills_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMainDesktopWidth
              ? null
              : DrawerMobile(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //Main
              if (constraints.maxWidth >= kMainDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onMenueTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},
                ),

              if (constraints.maxWidth >= kMainDesktopWidth)
                MainDesktop()
              else
                MainMobile(),

              //Skills
              Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 20, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    Text(
                      "What i can do?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),

                    SizedBox(height: 50),
                    SkillsDesktop(),
                  ],
                ),
              ),
              //Project Section
              Container(height: 500, width: double.maxFinite),
              //Contact
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),

              //Footer
              Container(height: 500, width: double.maxFinite),
            ],
          ),
        );
      },
    );
  }
}
