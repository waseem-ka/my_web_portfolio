import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/constants/size.dart';
import 'package:my_web_portfolio/widget/contact_section.dart';
import 'package:my_web_portfolio/widget/drawer_mobile.dart';
import 'package:my_web_portfolio/widget/footer.dart';
import 'package:my_web_portfolio/widget/header_desktop.dart';
import 'package:my_web_portfolio/widget/header_mobile.dart';
import 'package:my_web_portfolio/widget/main_desktop.dart';
import 'package:my_web_portfolio/widget/main_mobile.dart';
import 'package:my_web_portfolio/widget/project_section.dart';
import 'package:my_web_portfolio/widget/skills_desktop.dart';
import 'package:my_web_portfolio/widget/skills_mobile.dart';
import 'package:web/web.dart' as web;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                //Main
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      // Call Function
                      scrollToSection(navIndex);
                    },
                  )
                else
                  HeaderMobile(
                    onMenueTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                    onLogoTap: () {},
                  ),

                if (constraints.maxWidth >= kMinDesktopWidth)
                  MainDesktop()
                else
                  MainMobile(),

                //Skills
                Container(
                  key: navbarKeys[1],
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
                      if (constraints.maxWidth >= kMedDesktopWidth)
                        SkillsDesktop()
                      else
                        SkillsMobile(),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                //Project Section
                ProjectSection(key: navbarKeys[2]),

                //Contact
                SizedBox(height: 30),
                ContactSection(key: navbarKeys[3]),
                //Footer
                Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a Blog Page
      web.window.open("www.google.com", '_blank');
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
