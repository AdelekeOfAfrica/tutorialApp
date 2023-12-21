import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 24, fontWeight: fontWeight));
}

Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(text,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal));
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(text,
      textAlign: TextAlign.start,
      style:
          TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal));
}

Widget textUnderline({String text = "Your Text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}
