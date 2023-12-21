import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/common/routes/app_routes_name.dart';
import 'package:tutorialapp/global.dart';
import 'package:tutorialapp/pages/application/application.dart';
import 'package:tutorialapp/pages/home/view/home.dart';
import 'package:tutorialapp/pages/sigin_in/sign_in.dart';
import 'package:tutorialapp/pages/sign_up/sign_up.dart';
import 'package:tutorialapp/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.Welcome, page: Welcome()),
      RouteEntity(path: AppRoutesNames.Signin, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.register, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.Homepage, page: const Application()),
      RouteEntity(path: AppRoutesNames.Home, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      // print("clicked route ${settings.name}");
    }

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        //if we used this first time or not
        bool? deviceFirstTime = global.storageService.getDeviceFirstOpen();

        if (result.first.path == AppRoutesNames.Welcome && deviceFirstTime) {
          bool isLoggedIn = global.storageService.isLoggedIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Application(),
                settings:
                    settings); //if user is logged in it should go into the homepage
          } else {
            return MaterialPageRoute(
                builder: (_) => const SignIn(), settings: settings);
          }
        } else {
          if (kDebugMode) {
            // print("app ran first time ");
          }

          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }

    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
