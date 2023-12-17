import 'package:flutter/material.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: "Home page"),
    );
  }
}
