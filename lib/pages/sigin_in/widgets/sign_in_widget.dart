import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Center(
        child: text16Normal(text: "Log In", color: AppColors.primaryText)),
  );
}

Widget thirdPartyLogin() {
  return Container(
      margin: EdgeInsets.only(
        left: 80,
        right: 80,
        top: 40,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _loginButton("assets/icons/google.png"),
          _loginButton("assets/icons/apple.png"),
          _loginButton("assets/icons/facebook.png")
        ],
      ));
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(width: 40, height: 40, child: Image.asset(imagePath)));
}

Widget appTextField({
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5),
        Container(
            width: 325,
            height: 50,
            decoration: appBoxDecorationTextField(),
            //row contains icon and textfield
            child: Row(children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: AppImage(imagePath: iconName),
              ),
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    //border without any input
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    //inside border without any input
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  onChanged: (value) {},
                  maxLines: 1,
                  autocorrect: false,
                  // by default it is false
                  obscureText: obscureText,
                ),
              ),
            ])),
      ],
    ),
  );
}
