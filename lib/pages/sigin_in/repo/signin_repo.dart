import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorialapp/common/Models/entities.dart';
import 'package:tutorialapp/common/services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(
      String email, String password) async {
    final credencial = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credencial;
  }

  //fetching information from the liveserver
  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? params}) async {
    print(" giveninfo ${jsonEncode(params)}");
    var response =
        await HttpUtil().post("api/login", queryParameters: params?.toJson());

    // return UserLoginResponseEntity.fromJson(response);
    return UserLoginResponseEntity.fromJson(response);
  }
}
