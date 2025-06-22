import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.6,
      constraints: BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI'm Waseem Kaskas\n A Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Get in touch",
                    style: TextStyle(color: CustomColor.whitePrimary),
                  ),
                ),
              ),
            ],
          ),
          Image.asset("assets/avatar.png", width: screenWidth / 2),
        ],
      ),
    );
  }
}
