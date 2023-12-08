import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/widgets/popup_messages.dart';
import 'package:tutorialapp/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() {
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

    if (state.password != state.rePassword) {
      toastInfo("your password do not match");
      return;
    }
  }
}
