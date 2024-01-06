import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/services/http_util.dart';
import 'package:tutorialapp/common/Models/lesson_entities.dart';

class COurseDetailRepo {
  static Future<CourseDetailResponseEntity?> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/courseDetail", queryParameters: params?.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity?> courseLessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/lessonList", queryParameters: params?.toJson());

    return LessonListResponseEntity.fromJson(response);
  }
}
