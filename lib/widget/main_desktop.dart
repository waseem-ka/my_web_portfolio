import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:web/web.dart' as web;

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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowSecondary1,
                    foregroundColor: CustomColor.whitePrimary,
                  ),
                  onPressed: () {
                    web.window.open(
                      'https://drive.google.com/file/d/1oo3mOkw49KPWh8gKPmXQENtZiFcBuhs5/view?usp=drivesdk',
                      '_blank',
                    );
                  },
                  child: Text("Download CV"),
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
