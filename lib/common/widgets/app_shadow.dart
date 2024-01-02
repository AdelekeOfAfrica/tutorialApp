import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';

appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? boxBorder,
    BorderRadius? borderRadius}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: boxBorder,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem; // this is fetching from course entity model
  final Function()? func;
  const AppBoxDecorationImage(
      {Key? key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.profile,
      this.courseItem,
      this.func,
      this.fit = BoxFit
          .fitHeight}) //ImageRes.profile if you want to display default image in your asset folder
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalImagePath = imagePath.isNotEmpty ? imagePath : ImageRes.profile;
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: finalImagePath.isNotEmpty
              ? DecorationImage(
                  fit: fit,
                  image: NetworkImage(finalImagePath),
                )
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: courseItem == null
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: (FadeText(text: courseItem!.name!))),
                    Container(
                        margin: EdgeInsets.only(left: 20, bottom: 30),
                        child: (FadeText(
                            text: "${courseItem!.lesson_num!} Lessons",
                            color: AppColors.primaryFourElementText,
                            fontSize: 8))),
                  ]),
      ),
    );
  }
}
