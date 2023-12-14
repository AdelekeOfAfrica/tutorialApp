import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/global_loader/global_loader.dart';
import 'package:tutorialapp/common/widgets/popup_messages.dart';
import 'package:tutorialapp/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;
    // this is to check if username  text field is empty
    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("your name is to short");
      return;
    }

    //this is to check if the email textfield is empty
    if (state.email.isEmpty || name.isEmpty) {
      toastInfo("your email field is empty");
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("your password is empty");

      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("your password do not match");
      return;
    }

    //showing the loading icons
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    Future.delayed(const Duration(seconds: 2), () async {
      var context = Navigator.of(ref.context);

      try {
        final credencial = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (kDebugMode) {
          print(credencial);
        }

        if (credencial.user != null) {
          await credencial.user?.sendEmailVerification();
          await credencial.user
              ?.updateDisplayName(name); // this name is  assigned to username
          //get server photo url
          //get user photo url

          toastInfo("an email has been sent to your mail for verification");
          context.pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          toastInfo("This password is to weak");
        } else if (e.code == "email-already-in-use") {
          toastInfo("This email address has already being registered");
        } else if (e.code == "user-not-found") {
          toastInfo("User not found ");
        }
        print(e.code);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      //show the register page
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    });
  }
}
