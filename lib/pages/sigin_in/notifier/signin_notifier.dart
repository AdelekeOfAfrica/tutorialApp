import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/pages/sigin_in/notifier/signin_state.dart';

//state notifier saves states
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

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
}

// final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>
//  =>((ref) => SignInNotifier());

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());
