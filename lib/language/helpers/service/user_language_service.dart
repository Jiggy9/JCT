import 'package:jct/language/helpers/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLanguageService {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static void setPreferredLanguage(Language language) {
    _pref.setString("language_key", language.languageCode);
  }

  // get the preferred language
  static Language getPreferredLanguage() {
    final code = _pref.getString("language_key");
    for (var values in Language.values) {
      if (values.languageCode == code) {
        return values;
      }
    }
    return Language.english;
  }
}
