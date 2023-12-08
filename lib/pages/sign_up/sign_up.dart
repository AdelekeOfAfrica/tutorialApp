import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/apptext_field.dart';
import 'package:tutorialapp/common/widgets/button_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';
import 'package:tutorialapp/pages/sign_up/notifier/register_notifier.dart';
import 'package:tutorialapp/pages/sign_up/notifier/signup_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;
  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    //TODO: implement initState

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final regProvider = ref.watch(
        registerNotifierProvider); //registerNotifierProvider  was generated from
    //register_state.dart
    //dont forget using this flutter pub run build_runner watch --delete-conflicting-outputs to generate the above

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Signup"), // importing the class needed
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
                  text: "userName",
                  iconName: "assets/icons/user.png",
                  hintText: "userName",
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserNameChange(
                          value), //value is passed to the method in register_notifier
                ),
                SizedBox(height: 20),
                //email text box
                appTextField(
                  text: "email",
                  iconName: "assets/icons/user.png",
                  hintText: "email",
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserEmailChange(value),
                ),
                SizedBox(height: 20),
                //password text box
                appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Password",
                  obscureText: true,
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserPasswordChange(
                          value), //this has been decleared on the appTextField
                ),
                //confirm password
                SizedBox(height: 20),
                //password text box
                appTextField(
                  text: "Confirm password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Confirm password",
                  obscureText: true,
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserRePasswordChange(
                          value), //this has been decleared on the appTextField
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
                    func: () => _controller.handleSignUp(),
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
