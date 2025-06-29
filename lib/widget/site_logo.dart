import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "W",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: CustomColor.yellowSecondary1,
        ),
      ),
    );
  }
}
