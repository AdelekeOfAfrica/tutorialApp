import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/global_loader/global_loader.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/apptext_field.dart';
import 'package:tutorialapp/common/widgets/button_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sigin_in/notifier/siginin_controller.dart';
import 'package:tutorialapp/pages/sigin_in/notifier/signin_notifier.dart';
import 'package:tutorialapp/pages/sigin_in/widgets/sign_in_widget.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final signInProvider = ref.watch(signInNotifierProvider);
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Login"), // importing the class needed
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //top login button
                      thirdPartyLogin(),
                      //more login option message
                      Center(
                        child: const Text14Normal(
                            text: "Or use your email account to login"),
                      ),
                      SizedBox(height: 50),
                      //email text box
                      appTextField(
                          controller: _controller.emailController,
                          text: "Email",
                          iconName: "assets/icons/user.png",
                          hintText: "kindly enter your email address",
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserEmailChange(value)),
                      SizedBox(height: 20),
                      //password text box
                      appTextField(
                          controller: _controller.passwordController,
                          text: "Password",
                          iconName: "assets/icons/lock.png",
                          hintText: "kindly enter your password",
                          obscureText: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value)),
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
                      Center(
                          child: appButton(
                        buttonName: "Login",
                        func: () => _controller.handleSignIn(),
                      )),
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
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
