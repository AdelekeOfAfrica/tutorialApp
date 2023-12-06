import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/apptext_field.dart';
import 'package:tutorialapp/common/widgets/button_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(), // importing the class needed
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: text14Normal(
                      text: "Enter your details below and signup for free"),
                ),
                SizedBox(height: 50),
                //username section
                appTextField(
                  text: "Username",
                  iconName: "assets/icons/user.png",
                  hintText: "username",
                ),
                SizedBox(height: 20),
                //email text box
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Email"),
                SizedBox(height: 20),
                //password text box
                appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "password",
                  obscureText: true,
                ),
                //confirm password
                SizedBox(height: 20),
                //password text box
                appTextField(
                  text: "Confirm password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Confirm password",
                  obscureText: true,
                ),
                //lets add space to the code
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 25),
                    child: text14Normal(
                        text:
                            "By creating an account you are agreeing to the terms and conditions")),

                SizedBox(height: 50),
                //login button
                Center(
                  child: appButton(
                    buttonName: "Register",
                    isLogin: true,
                    context: context,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //app register button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
