import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage(
      {super.key,
      this.width = 16,
      this.height = 16,
      this.imagePath = ImageRes.profile});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath.isEmpty ? "assets/icons/photo.png" : imagePath,
        width: width, height: height);
  }
}

Widget AppImageWithColor(
    {String imagePath = "assets/icons/user.png",
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement}) {
  return Image.asset(imagePath.isEmpty ? "assets/icons/user.png" : imagePath,
      width: width, height: height, color: color);
}
