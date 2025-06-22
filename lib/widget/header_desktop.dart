import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/constants/nav_items.dart';
import 'package:my_web_portfolio/styles/style.dart';
import 'package:my_web_portfolio/widget/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () {}),
          Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
