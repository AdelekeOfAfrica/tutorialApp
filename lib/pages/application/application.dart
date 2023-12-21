import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/pages/application/notifier/application_nav_notifier.dart';
import 'package:tutorialapp/pages/application/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: appScreen(
            index:
                index), // this is defined in the widget.dart and dont forget it is counting with the app route  defined in the routes.dart
        bottomNavigationBar: Container(
            width: 375,
            height: 58,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                //lets catch the value in the application_nav_notifier state
                ref
                    .read(applicationNavIndexProvider.notifier)
                    .changeIndex(value);
              },
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
            )),
      )),
    );
  }
}
