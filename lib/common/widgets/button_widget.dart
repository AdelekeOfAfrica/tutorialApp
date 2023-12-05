import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';

Widget appButton(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: buildAppbar(),
              body: Container(
                color: Colors.white,
              ),
            ),
          ));
    },
    child: Container(
      width: 325,
      height: 56,
      //isLogin true then send the primary color else send white color

      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: text16Normal(
              text: buttonName,
              color: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText)),
    ),
  );
}
