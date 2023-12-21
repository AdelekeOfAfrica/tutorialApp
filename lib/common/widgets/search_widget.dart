import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/apptext_field.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text box
      Container(
        width: 280,
        height: 40,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              child: AppImage(imagePath: ImageRes.searchIcon),
              margin: EdgeInsets.only(left: 17),
            ),
            SizedBox(
                width: 240,
                height: 40,
                child: appTextFieldOnly(
                    width: 240, height: 40, hintText: "Search..")),
          ],
        ),
      ),
      //end of search text box
      GestureDetector(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.all(5),
            width: 40,
            height: 40,
            child: AppImage(imagePath: ImageRes.searchButton),
            decoration: appBoxShadow(
                boxBorder: Border.all(color: AppColors.primaryElement))),
      )
    ],
  );
}
