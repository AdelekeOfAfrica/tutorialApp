import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/apptext_field.dart';
import 'package:tutorialapp/common/widgets/button_widget.dart';
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
          appBar: buildAppbar(title: "Login"), // importing the class needed
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top login button
                thirdPartyLogin(),
                //more login option message
                Center(
                  child:
                      text14Normal(text: "Or use your email account to login"),
                ),
                SizedBox(height: 50),
                //email text box
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "kindly enter your email address"),
                SizedBox(height: 20),
                //password text box
                appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "kindly enter your password",
                  obscureText: true,
                ),
                //lets add space to the code
                SizedBox(
                  height: 20,
                ),
                //forgot password
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: textUnderline(text: "forgot your password ?"),
                ),
                SizedBox(height: 80),
                //login button
                Center(child: appButton(buttonName: "Login")),
                //app register button
                SizedBox(height: 20),
                Center(
                    child: appButton(
                  buttonName: "Register",
                  isLogin: false,
                  context: context,
                  func: () {
                    Navigator.pushNamed(context, "/register");
                  }, // this func has been passed in the appButton section
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
