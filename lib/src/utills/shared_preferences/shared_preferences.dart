import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{

  static late final SharedPreferences _preferences;
  static const OnBoardKey = "OnBoard";
  static const WelcomeScreenKey = "WelcomeScreen";

  static Future init () async => _preferences = await SharedPreferences.getInstance();

  static Future setonBoardingState(bool state) async => await _preferences.setBool(OnBoardKey, state);
  static bool? GetonBoardingState() => _preferences.getBool(OnBoardKey);
  static Future removeOnBoardingState() async => await _preferences.remove(OnBoardKey);

  static Future setWelcomeScreenState(bool state) async => await _preferences.setBool(WelcomeScreenKey,state);
  static bool? GetWelcomeScreenState() => _preferences.getBool(WelcomeScreenKey);
  static Future removeWelcomeScreen()=> _preferences.remove(WelcomeScreenKey);

}