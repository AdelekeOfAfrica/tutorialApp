import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/entities/entities.dart';
import 'package:tutorialapp/common/global_loader/global_loader.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/popup_messages.dart';
import 'package:tutorialapp/global.dart';
import 'package:tutorialapp/pages/application/application.dart';
import 'package:tutorialapp/pages/sigin_in/notifier/signin_notifier.dart';

class SignInController {
  // late BuildContext context;
  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    //this is to check if the email textfield is empty
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("your email field is empty");
      return;
    }

    if ((state.password.isEmpty || password.isEmpty)) {
      toastInfo("your password is empty");

      return;
    }
    //this code should be used after fetching your user.dart and entities.dart folder
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    //debuging terms
    print("0");

    try {
      final credencial = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //debuging terms
      print("1");

      if (credencial.user == null) {
        toastInfo("User not found");
      }

      if (!credencial.user!.emailVerified) {
        //email not verified
        toastInfo("you must verify the email address");
      }

      var user = credencial.user;
      print("3");

      if (user != null) {
        print("4");
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        // you should only use the below code if you have copied the user.dart and entities.dart

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print("user logged in");
        }
      } else {
        toastInfo("login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toastInfo("the user does not exists");
      } else if (e.code == "wrong-password") {
        toastInfo(
            " this account does not exist or your email && password combination is wrong");
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    // ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    //we need to talk to server

    //have local storage
    try {
      var navigator = Navigator.of(ref.context);
      //try to remember user info
      global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, "123");
      global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY, "africa_2023"); //your password

      navigator.pushNamedAndRemoveUntil(
          "/application",
          (route) =>
              false); //this is the right one , it ensures you login first before you access the login page
    } catch (e) {}

    //redirect to new page
  }
}
