import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';

// ignore: non_constant_identifier_names
Widget AppImage(
    {String imagePath = "assets/icons/user.png",
    double width = 16,
    double height = 16}) {
  return Image.asset(imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
      width: width, height: height);
}

Widget AppImageWithColor(
    {String imagePath = "assets/icons/user.png",
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement}) {
  return Image.asset(imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
      width: width, height: height, color: color);
}
