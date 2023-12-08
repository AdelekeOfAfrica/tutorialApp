import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorialapp/pages/sign_up/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  //$RegisterNotifier is fetched from register_notifier.g.dart
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(
      //copyWith has been defined in the register_state
      userName: name,
    );
  }

  void onUserEmailChange(String email) {
    state = state.copyWith(
      email: email,
    );
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(
      password: password,
    );
  }

  void onUserRePasswordChange(String rePassword) {
    state = state.copyWith(
      rePassword: rePassword,
    );
  }
}
