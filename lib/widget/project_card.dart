import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/utils/projects_utils.dart';
import 'package:web/web.dart' as web;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;

  void openLink(String url) {
    web.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 340,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Project Image:
          Image.asset(
            project.image,
            width: 260,
            height: 140,
            fit: BoxFit.cover,
          ),
          //Title:
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //subtitle:
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          Spacer(),
          //Footer
          Container(
            color: CustomColor.bgLight1,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      openLink(project.iosLink as String);
                    },
                    child: Image.asset("assets/mac-os.png", width: 17),
                  ),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: InkWell(
                      onTap: () {
                        openLink(project.androidLink as String);
                      },
                      child: Image.asset("assets/android-os.png", width: 17),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: InkWell(
                      onTap: () {
                        openLink(project.webLink as String);
                      },
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/geography.png", width: 17),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
