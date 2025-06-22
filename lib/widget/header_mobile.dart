import 'package:flutter/material.dart';
import 'package:my_web_portfolio/styles/style.dart';
import 'package:my_web_portfolio/widget/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenueTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenueTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          Spacer(),
          IconButton(onPressed: onMenueTap, icon: Icon(Icons.menu)),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
