import 'package:flutter/material.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/button_widget.dart';
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

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({Key? key, required this.courseItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
              text: courseItem.name ?? "No course name found",
              color: AppColors.primaryText,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold),
          Container(
              child: Text11Normal(
                  text: courseItem.description ?? "no description found ",
                  color: AppColors.primaryThreeElementText,
                  textAlign: TextAlign.start))
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25),
        child: const appButton(buttonName: "Add to Cart"));
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25), //space
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text16Normal(
            text: "Course Includes",
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold),
        SizedBox(height: 16),
        CourseInfo(
            imagePath: ImageRes.videoDetail,
            length: courseItem.video_length.toString(),
            infoText: "Hours Video"),
        SizedBox(height: 16),
        CourseInfo(
            imagePath: ImageRes.fileDetail,
            length: courseItem.lesson_num.toString(),
            infoText: "Number of files"),
        SizedBox(height: 16),
        CourseInfo(
            imagePath: ImageRes.downloadDetail,
            length: courseItem.down_num.toString(),
            infoText: "Number of Items to download")
      ]),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final String? length;
  final String? infoText;
  const CourseInfo(
      {super.key,
      required this.imagePath,
      this.length,
      this.infoText = "Items"});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          alignment: Alignment.center,
          child: AppImage(imagePath: imagePath, width: 30, height: 30)),
      Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text11Normal(
              text: (length == 'null' ? "0 $infoText" : "$length $infoText"),
              color: AppColors.primarySecondaryElementText))
    ]);
  }
}

class LessonInfo extends StatelessWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text16Normal(
              text: "Lesson List",
              color: AppColors.primaryText,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 20),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 325,
              height: 80,
              decoration: appBoxShadow(
                  radius: 10,
                  sR: 2,
                  bR: 3,
                  color: Color.fromRGBO(255, 255, 255, 1)),
              child: InkWell(
                  onTap: () {},
                  child: Row(children: [
                    AppBoxDecorationImage(
                        width: 60,
                        height: 60,
                        imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}01.png"),
                    SizedBox(width: 8),
                    const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text13Normal(text: "This is first lesson"),
                          Text10Normal(text: "This is description"),
                        ]),
                    Expanded(child: Container()),
                    const AppImage(
                        imagePath: ImageRes.arrowRight, width: 24, height: 24)
                  ]))),
        ]));
  }
}
