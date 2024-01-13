import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/pages/lesson_detail/controller/lesson_detail_controller.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];

    super.didChangeDependencies();
  }

  Widget build(
    BuildContext context,
  ) {
    var lessonDetail =
        ref.watch(courseLessonDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: lessonDetail.when(
              data: (data) => Column(children: [
                    Text(data!
                        .elementAt(0)
                        .name
                        .toString()), //not that we are using this elementAt, because it is returning list of result, so we are choosing the first one
                    AppBoxDecorationImage(
                        imagePath:
                            "${AppConstants.IMAGE_UPLOADS_PATH}${data!.elementAt(0).thumbnail}", //displaying the image
                        width: 325,
                        height: 200,
                        fit: BoxFit.fitWidth),
                  ]),
              error: (error, traceStack) => Text(error.toString()),
              loading: () => const Text("fetching Lesson Details"))),
    );
  }
}
