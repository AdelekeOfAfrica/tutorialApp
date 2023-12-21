import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/search_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/global.dart';
import 'package:tutorialapp/pages/home/view/widgets/home_widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(title: "home"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                helloText(),
                userName(),
                SizedBox(height: 20),
                searchBar(),
              ],
            ),
          ),
        ));
  }
}
