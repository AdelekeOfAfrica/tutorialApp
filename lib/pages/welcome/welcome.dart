import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/widget.dart';

final indexProvider = StateProvider<int>(
  (ref) => 0,
);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our 3 welcome pages
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexProvider.notifier).state = value;
                  },
                  controller: _controller,
                  // scrollDirection: Axis.vertical,// to scroll up
                  scrollDirection: Axis.horizontal,
                  children: [
                    // first page
                    AppOnBoardingPage(
                      controller: _controller,
                      imagePath: ImageRes.reading,
                      title: "Get your online certificate",
                      subtitle:
                          "Why go to a physical university,when you can get your certificate online ",
                      index:
                          1, //this has been initialized on the onBoardingPage widget itself
                      context: context,
                    ),

                    //second page
                    AppOnBoardingPage(
                        controller: _controller,
                        imagePath: ImageRes.man,
                        title: "Here at test university",
                        subtitle:
                            "we give you the oppurtunity to test our services and you will see how beautiful our system is",
                        index: 2,
                        context: context),

                    AppOnBoardingPage(
                      controller: _controller,
                      imagePath: ImageRes.boy,
                      title: "Education is key",
                      subtitle:
                          "Anywhere, any time, the time is at your discretion ",
                      index: 3,
                      context: context,
                    ),
                  ],
                ), //this pageView is used to scrollImages on the app
                Positioned(
                    child: DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
