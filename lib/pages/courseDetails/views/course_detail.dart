import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/utilities/app_colors.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/app_bar.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/courseDetails/controller/course_Detail_controller.dart';
import 'package:tutorialapp/pages/courseDetails/views/widgets/course_widget.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    //todo:implement didChangeDependencies
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    //fetching all the data into the args parameters
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData = ref.watch(courseDetailControllerProvider(
        index:
            args.toInt())); //indexs has been passed in the CourseDetailProvider
    print(stateData);
    return Scaffold(
        appBar: buildGlobalAppbar(title: "Course Detail Page "),
        body: stateData.when(
            data: (data) => data == null
                ? const SizedBox()
                : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    CourseDetailThumbnail(
                        courseItem:
                            data), //passing the data to the course item and this is displaying the image
                    CourseDetailsIconText(
                        courseItem:
                            data) // this container is to show the menu buttons
                  ]),
            error: (error, tracestack) {
              print(error.toString());
              print(stateData.toString());
              return const Center(
                  child: Text("Error Loading Course details ..."));
            },
            loading: () => Center(child: CircularProgressIndicator())));
  }
}
