import 'package:flutter/material.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';

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
