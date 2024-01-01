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

// Widget text16Normal(
//     {String text = "", Color color = AppColors.primarySecondaryElementText}) {
//   return Text(text,
//       textAlign: TextAlign.center,
//       style:
//           TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal));
// }

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal(
      {Key? key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight));
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text10Normal(
      {Key? key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 10, fontWeight: fontWeight));
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text11Normal(
      {Key? key,
      this.text = "",
      this.color = AppColors.primaryElementText,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 11, fontWeight: fontWeight));
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const FadeText(
      {Key? key,
      this.text = "",
      this.color = AppColors.primaryElementText,
      this.fontSize = 10})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.bold));
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text14Normal(
      {Key? key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: color, fontSize: 14, fontWeight: FontWeight.normal));
  }
}

// Widget text14Normal(
//     {String text = "", Color color = AppColors.primaryThreeElementText}) {
//   return Text(text,
//       textAlign: TextAlign.start,
//       style:
//           TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal));
// }

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
