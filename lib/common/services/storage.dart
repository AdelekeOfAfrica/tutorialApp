import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorialapp/common/Models/entities.dart';
import 'package:tutorialapp/common/utilities/constants.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  //storing our user token from the backend
  String getUserToken() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ??
        false; //this condition is checking if the application is opened for the first time
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
    // this condition is checking if the user is logged in
  }

  UserProfile getUserProfile() {
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
}
