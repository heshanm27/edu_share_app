import 'dart:developer';
import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:edu_share_app/src/screens/auth_screen/signin_screen/signin_screen.dart';
import 'package:edu_share_app/src/screens/startup_screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:edu_share_app/src/screens/startup_screen/welcome_screen/welcome_screen.dart';
import 'package:edu_share_app/src/utils/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // // FlutterNativeSplash.remove();
  await AppSharedPreferences.init();
  runApp(App());
}




class App extends StatefulWidget {
   App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var OnBoardState  = AppSharedPreferences.GetonBoardingState() ?? true;
  var WelcomeScreenState = AppSharedPreferences.GetWelcomeScreenState() ?? true;
  @override
  void initState() {
    super.initState();
    log("Shareprefvalue $OnBoardState");
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context,child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor:tPrimaryColor,

            ),
            home: OnBoardState ? OnBoardingScreen() : WelcomeScreenState ? WelcomeScreen() : SignIn(),
        ),
      designSize:const Size(360, 800) ,
    );
  }
}

