import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/services/http_util.dart';

class COurseDetailRepo {
  static Future<CourseDetailResponseEntity?> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/courseDetail", queryParameters: params?.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }
}
