import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_nav_notifier.g.dart';

@riverpod

//make sure you import this part 'application_nav_notifier.g.dart';
//do not forget run the command line flutter pub run build_runner watch  --delete-conflicting-outputs
class ApplicationNavIndex extends _$ApplicationNavIndex {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int val) {
    state = val;
    print(state);
  }
}
