import 'package:flutter/material.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        child: AppBoxDecorationImage(
          imagePath:
              "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
          width: 325,
          height: 200,
          fit: BoxFit.fitWidth,
        ));
  }
}

class CourseDetailsIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 325,
      child: Row(
        children: [
          GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: appBoxShadow(radius: 7),
                  child: const Text10Normal(
                      text: "Author Page ",
                      color: AppColors.primaryElementText))),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.profile),
                Text11Normal(
                    text:
                        "${courseItem.follow == null ? "0" : courseItem.follow.toString()}",
                    color: AppColors.primaryElement),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.star),
                Text11Normal(
                    text:
                        "${courseItem.score == null ? "0" : courseItem.score.toString()}",
                    color: AppColors.primaryElement),
              ],
            ),
          )
        ],
      ),
    );
  }
}
