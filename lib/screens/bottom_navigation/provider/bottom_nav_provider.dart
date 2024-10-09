import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bottom_nav_provider.g.dart';

// @riverpod
// bottomNavigationBarIndex(BottomNavigationBarIndexRef ref,
//     {int newCurrentIndex = 0}) {
//   return newCurrentIndex;
// }
@riverpod
class BottomNavigationBarIndex extends _$BottomNavigationBarIndex {
  @override
  int build() {
    return 0;
  }

  // Method to update the index
  void updateIndex(int newIndex) {
    state = newIndex;
  }
}
