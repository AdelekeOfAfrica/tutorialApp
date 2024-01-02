import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorialapp/pages/courseDetails/courseDetailRepo.dart';
part 'course_Detail_controller.g.dart';

@riverpod
Future<CourseItem?> CourseDetailController(CourseDetailControllerRef ref,
    {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;

  final response =
      await COurseDetailRepo.courseDetail(params: courseRequestEntity);

  if (response!.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }

  return null;
}
