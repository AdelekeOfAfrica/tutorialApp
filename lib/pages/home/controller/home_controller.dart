import 'package:riverpod_annotation/riverpod_annotation.dart';
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
