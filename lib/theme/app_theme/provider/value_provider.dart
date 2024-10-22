import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'value_provider.g.dart';
@riverpod
class ValueNotifier extends _$ValueNotifier {
  @override
  bool build() {
    return false ;


  }

  bool updateValue(bool value){
    return state = value;
  }
}