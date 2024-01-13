import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorialapp/common/Models/lesson_entities.dart';
import 'package:tutorialapp/pages/lesson_detail/Repo/lesson_repo.dart';
part 'lesson_detail_controller.g.dart';

//dont forget to run  flutter pub run build_runner  watch --delete-conflicting-outputs
@riverpod
Future<List<LessonItem>?> CourseLessonDetailController(
    CourseLessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);

  if (response!.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }

  return null;
}
