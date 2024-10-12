

import 'package:jct/language/helpers/language.dart';
import 'package:jct/language/helpers/service/user_language_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';
@riverpod
class LocalLanguage extends _$LocalLanguage {
  @override
 Language  build() {
    return UserLanguageService.getPreferredLanguage() ;
  }

  void changeLanguage(Language languageFromUser){
    state = languageFromUser;
    UserLanguageService.setPreferredLanguage(languageFromUser);
  }

}