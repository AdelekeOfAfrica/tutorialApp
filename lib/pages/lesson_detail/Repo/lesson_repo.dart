import 'package:tutorialapp/common/Models/lesson_entities.dart';
import 'package:tutorialapp/common/services/http_util.dart';

class LessonRepo {
  static Future<LessonListResponseEntity> courseLessonDetail(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/lessonDetail", queryParameters: params?.toJson());

    return LessonListResponseEntity.fromJson(response);
  }
}
