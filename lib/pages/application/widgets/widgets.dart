import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/pages/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon: _bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.search),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.search, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.play),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.play, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.message),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.message, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "message"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.profile),
      activeIcon: _bottomContainer(
          imagePath: ImageRes.profile, color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "profile"),
];

//making the buttom re-usable
Widget _bottomContainer(
    {double width = 15,
    double height = 15,
    String imagePath = ImageRes.home,
    Color color = AppColors.primaryFourElementText}) {
  return SizedBox(
    width: 15,
    height: 15,
    child: AppImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreen({int index = 0}) {
  List<Widget> screens = [
    const Home(),
    Center(
      child: AppImage(
        imagePath: ImageRes.search,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: AppImage(
        imagePath: ImageRes.play,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: AppImage(
        imagePath: ImageRes.message,
        width: 250,
        height: 250,
      ),
    ),
    Center(
      child: AppImage(
        imagePath: ImageRes.profile,
        width: 250,
        height: 250,
      ),
    ),
  ];
  return screens[index];
}

// void main() {
//   ImageRes
//       ._imageBase; // this is pointing to the imageRes class in the image resources and the function ImageBase
// }
