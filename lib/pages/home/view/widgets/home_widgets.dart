import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/global.dart';

Widget userName() {
  return Container(
      child: text24Normal(
    text: global.storageService.getUserProfile().name!,
    fontWeight: FontWeight.bold,
  ));
}

Widget helloText() {
  return Container(
    child: text24Normal(
      text: "Hello",
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.bold,
    ),
  );
}
