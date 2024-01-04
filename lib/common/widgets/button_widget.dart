import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';
import 'package:tutorialapp/pages/sign_up/sign_up.dart';

class appButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final bool isLogin;
  final BuildContext? context;
  final void Function()? func;
  const appButton(
      {Key? key,
      this.width = 325,
      this.height = 50,
      this.buttonName = "",
      this.isLogin = true,
      this.context,
      this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 325,
        height: 56,
        //isLogin true then send the primary color else send white color

        decoration: appBoxShadow(
            color: isLogin ? AppColors.primaryElement : Colors.white,
            boxBorder: Border.all(color: AppColors.primaryFourElementText)),
        child: Center(
            child: Text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
  }
}
