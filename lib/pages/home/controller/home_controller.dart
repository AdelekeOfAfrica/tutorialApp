import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutorialapp/common/Models/course_entities.dart';
import 'package:tutorialapp/common/api/course_api.dart';
import 'package:tutorialapp/global.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
//dont forget to run  flutter pub run build_runner  watch --delete-conflicting-outputs
// keepalive means that you meet the page exactly where you left the page

class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}

//dont forget to run  flutter pub run build_runner  watch --delete-conflicting-outputs
@riverpod
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> _fetchCourseList() async {
    //List<CourseItem>is from the course entity model

    //calling the model
    var result = await CourseApi.courseList();

    if (result.code == 200) {
      return result.data;
    }

    return null;
  }

  @override
  FutureOr<List<CourseItem>?> build() async {
    return _fetchCourseList(); // this fetch the data first and pass it to the HomeCourseList
  }
}
