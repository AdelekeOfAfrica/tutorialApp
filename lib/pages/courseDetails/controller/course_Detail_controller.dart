import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorialapp/common/Models/lesson_entities.dart';
import 'package:tutorialapp/pages/courseDetails/course_repo.dart';
part 'course_Detail_controller.g.dart';

//dont forget to run  flutter pub run build_runner  watch --delete-conflicting-outputs
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

//dont forget to run  flutter pub run build_runner  watch --delete-conflicting-outputs
@riverpod
Future<List<LessonItem>?> CourseLessonListController(
    CourseLessonListControllerRef,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  final response =
      await COurseDetailRepo.courseLessonList(params: lessonRequestEntity);

  if (response!.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }

  return null;
}
