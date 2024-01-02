import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/utilities/image_resources.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/global.dart';
import 'package:tutorialapp/pages/home/controller/home_controller.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({Key? key, required this.controller, required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //banners
        SizedBox(
          width: 325,
          height: 160,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              //by default the index changes its value as it changes
              //this is managing the state provider of homescreenDotProvider
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(
                  index); //this is homescreenbannerDots controller in the home_controller
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        //end of banners
        //dots
        SizedBox(height: 5),
        DotsIndicator(
          //this is waching the state that is passed
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        )

        //endof dots
      ],
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: text24Normal(
      text: global.storageService.getUserProfile().name!,
      fontWeight: FontWeight.bold,
    ));
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: "Hello",
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget bannerContainer({String? imagePath = ""}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath!),
        fit: BoxFit.fill,
      ),
    ),
  );
}

AppBar homeAppbar() {
  return AppBar(
    title: Container(
        margin: EdgeInsets.only(left: 7, right: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppImage(width: 18, height: 12, imagePath: ImageRes.menu),
            GestureDetector(
              child: const AppBoxDecorationImage(),
            ),
          ],
        )),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // see all course
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "choose your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "see all",
                ),
              ),
            ],
          ),
        ),
        //end of see all course

        //course item button
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              decoration:
                  appBoxShadow(color: AppColors.primaryElement, radius: 7.3),
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text11Normal(text: "All"),
            ),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: const Text11Normal(
                  text: "Popular",
                  color: AppColors.primaryThreeElementText,
                )),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: const Text11Normal(
                  text: "Newest",
                  color: AppColors.primaryThreeElementText,
                )),
          ],
        ),
        //end of course item button
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    //passing the fetched data
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 0),
      child: courseState.when(
          data: (data) => GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.6,
                ),
                itemCount: data?.length,
                itemBuilder: (_, int index) {
                  // return AppImage(); this is for the default image that was hardcoded
                  return AppBoxDecorationImage(
                      imagePath: //AppImage()
                          "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail!}",
                      fit: BoxFit.fitWidth,
                      courseItem: data[index],
                      func: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return Scaffold(
                        //       appBar: AppBar(),
                        //       body: Center(
                        //           child: Text(data[index].id.toString())));
                        // }));
                        Navigator.of(context).pushNamed("/course_details",
                            arguments: {"id": data[index].id!});
                      });
                },
              ),
          error: (error, stackTrace) {
            print(error.toString());
            print(stackTrace.toString());
            return Center(child: Text("Error Loading data ..."));
          },
          loading: () => const Center(child: Text("Loading..."))),
    );
  }
}
