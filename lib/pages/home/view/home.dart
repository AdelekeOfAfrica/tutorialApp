import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/search_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/global.dart';
import 'package:tutorialapp/pages/home/controller/home_controller.dart';
import 'package:tutorialapp/pages/home/view/widgets/home_widgets.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;
  // @override
  // void initState() {
  //   //Todo : implement initState
  //   super.initState();
  // }  this only load the first state, it does not care if dependency changes

  @override
  void didChangeDependencies() {
    //todo: implement didchangedependencies
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: homeAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const HelloText(),
                const UserName(),
                SizedBox(height: 20),
                searchBar(),
                SizedBox(height: 20),
                HomeBanner(
                    ref: ref,
                    controller:
                        _controller), //we are passing ref into the banners
                const HomeMenuBar(),
                CourseItemGrid(ref: ref),
                // CustomScrollView(
                //     physics:
                //         const ScrollPhysics(), //this handle the scrolling of the page
                //     shrinkWrap: true,
                // slivers: [
                // SliverPadding(
                //   padding: EdgeInsets.all(20),
                // sliver: SliverGrid.count(
                // crossAxisCount:
                //   2, // this displays the nurmber of grid box given
                //crossAxisSpacing: 40, // adding of spaces
                //children: const [
                // Text("physics"),
                // Text("chemistry"),
                //Text("Geography"),
                //],
                //)),
                //]),
              ],
            ),
          ),
        ));
  }
}
