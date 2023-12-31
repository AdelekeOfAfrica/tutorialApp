import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/services/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post("api/courseList");

    return CourseListResponseEntity.fromJson(response);
  }
}
