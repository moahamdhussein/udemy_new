import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBooleanDarkMode({required String key}) {
    print('${sharedPreferences!.getBool('isDark')}' + "  isDark");
    if (sharedPreferences!.getBool('isDark') != null) {
      return sharedPreferences!.getBool('isDark');
    } else {
      return false;
    }
  }
}
