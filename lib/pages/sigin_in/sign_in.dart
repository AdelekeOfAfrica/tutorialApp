import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(), // importing the class needed
          backgroundColor: Colors.white,
          body: Column(
            children: [
              //top login button
              thirdPartyLogin(),
              //more login option message
              text14Normal(text: "Or use your email account to login"),
            ],
          ),
        ),
      ),
    );
  }
}
