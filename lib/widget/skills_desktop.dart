import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //platforms and skills
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platforms
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450.0),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    leading: Image.asset(platformItems[i]['img'], width: 26.0),
                    title: Text(platformItems[i]['title']),
                  ),
                ),
            ],
          ),
        ),

        SizedBox(width: 50.0),

        //skills:
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    backgroundColor: CustomColor.bgLight2,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    label: Text(skillItems[i]["title"]),
                    avatar: SvgPicture.asset(skillItems[i]['img']),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
