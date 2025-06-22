import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withValues(alpha: 0.6),
                  CustomColor.scaffoldBg.withValues(alpha: 0.6),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset('assets/avatar.png', width: screenWidth),
          ),
          SizedBox(height: 30.0),
          //intro Text
          Text(
            "Hi,\nI'm Waseem Kaskas\n A Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 195,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Get in touch",
                style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
