import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/pages/sigin_in/sign_in.dart';

Widget onBoardingPage(
  PageController controller, {
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subtitle = "",
  index = 0,
  required BuildContext context,

  // intializing the counter so the pages can scroll//
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subtitle),
      ),
      _nextButton(index, controller, context as BuildContext),
    ],
  );
}

Widget _nextButton(index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => const SignIn())); //first way you can use to access the portal

        Navigator.pushNamed(context, "signIn");
      }
    },
    child: Container(
      margin: EdgeInsets.only(top: 80, left: 25, right: 25),
      width: 325,
      height: 50,
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(text: "Next", color: Colors.white),
      ),
    ),
  );
}
