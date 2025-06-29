import 'package:flutter/material.dart';
import 'package:my_web_portfolio/constants/colors.dart';
import 'package:my_web_portfolio/constants/size.dart';
import 'package:my_web_portfolio/constants/sns_links.dart';
import 'package:my_web_portfolio/service/contact_service.dart';
import 'package:my_web_portfolio/widget/custom_text_field.dart';
import 'package:web/web.dart' as web;

class ContactSection extends StatefulWidget {
  ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  void openLink(String url) {
    web.window.open(url, '_blank');
  }

  final TextEditingController Name = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Message = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight2,
      child: Column(
        children: [
          //title:
          Text(
            "Get in Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, Constraints) {
                if (Constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFildDesktop(Name, Email);
                }
                return buildNameEmailFildMobile(Name, Email);
              },
            ),
          ),
          SizedBox(height: 15),
          //message
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: 'Your name',
              maxLines: 10,
              controller: Message,
            ),
          ),
          //send button
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowSecondary1,
                  foregroundColor: CustomColor.whitePrimary,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  sendToTelegram(
                    name: Name.text,
                    email: Email.text,
                    message: Message.text,
                  );

                  await Future.delayed(Duration(milliseconds: 500));

                  setState(() {
                    isLoading = false;

                    // إعادة تعيين كل شي
                    Name.clear();
                    Email.clear();
                    Message.clear();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("✅ Message sent successfully!")),
                  );
                },
                child: Text("Get in touch"),
              ),
            ),
          ),
          SizedBox(height: 30),
          //Icons SNS links
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Divider(color: CustomColor.whiteSecondary),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  openLink(SnsLinks.linkedin);
                },
                child: Image.asset("assets/LinkedIn.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  openLink(SnsLinks.facebook);
                },
                child: Image.asset("assets/facebook.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  openLink(SnsLinks.telegram);
                },
                child: Image.asset("assets/telegram.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  openLink(SnsLinks.whatsapp);
                },
                child: Image.asset("assets/whatsapp.png", width: 28),
              ),
              InkWell(
                onTap: () async {
                  openLink(SnsLinks.github);
                },
                child: Image.asset("assets/github.png", width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFildDesktop(
    TextEditingController name,
    TextEditingController email,
  ) {
    return Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: 'Your name', controller: name),
        ),
        SizedBox(width: 15),
        //email
        Flexible(
          child: CustomTextField(hintText: "Email", controller: email),
        ),
      ],
    );
  }

  Column buildNameEmailFildMobile(
    TextEditingController name,
    TextEditingController email,
  ) {
    return Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: 'Your name', controller: name),
        ),
        SizedBox(height: 15),
        //email
        Flexible(
          child: CustomTextField(hintText: "Email", controller: email),
        ),
      ],
    );
  }
}
