import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:edu_share_app/src/screens/auth_screen/signin_screen/signin_screen.dart';
import 'package:edu_share_app/src/screens/startup_screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:edu_share_app/src/utils/shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
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
  await Firebase.initializeApp();
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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context,child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor:tPrimaryColor,
              brightness: Brightness.light,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: tTextColor)
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: tPrimaryColor
                )
              )
            ),
            darkTheme: ThemeData(brightness: Brightness.dark,),
            themeMode: ThemeMode.system,
            home: OnBoardState ? OnBoardingScreen() : SignIn(),
        ),
      designSize:const Size(360, 812),
    );
  }
}

