import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:edu_share_app/src/controllers/user_controller/user_controller.dart';
import 'package:edu_share_app/src/models/user_model/User.dart';
import 'package:edu_share_app/src/screens/auth_screen/signin_screen/signin_screen.dart';
import 'package:edu_share_app/src/screens/org_screens/org_edufeed_screen/org_edufeed_screen.dart';
import 'package:edu_share_app/src/screens/startup_screen/intrest_area_screen/intrest_area_screen.dart';
import 'package:edu_share_app/src/screens/startup_screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:edu_share_app/src/screens/user_screens/home_screen/home_screen.dart';
import 'package:edu_share_app/src/utils/shared_preferences/shared_preferences.dart';
import 'package:edu_share_app/src/utils/snack_bar/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        scaffoldMessengerKey: CustomSnackBars.messengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: tPrimaryColor,
            brightness: Brightness.light,
            textTheme: TextTheme(subtitle1: TextStyle(color: tTextColor),headline3: TextStyle(color: tPrimaryColor)),

            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: tPrimaryColor))),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: MainPage(),
      ),
      designSize: const Size(360, 812),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  var OnBoardState = AppSharedPreferences.GetonBoardingState() ?? true;
  final userController = UserController();

  Future<UserModel?> getRoles(String id) async {
    UserModel userRole = await userController.checkUserType(id);
    return userRole;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder(future:getRoles(snapshot.data!.uid) ,builder: (context, roleSnapshot) {
            if(roleSnapshot.hasData){

              print(roleSnapshot.data);
              if(roleSnapshot.data!.newUser == true){
                return InterestArea();
              }
              else if(roleSnapshot.data?.userRole == 'org' ){
                return OrgEduFeed();
              }else{
                return HomeScreen();
              }
            }else{
              return LoadingWidget();
            }
          },
          );
        } else {
          return OnBoardState ? OnBoardingScreen() : SignIn();
        }
      },
    ));
  }
}


Widget LoadingWidget(){
  return Container(
    child: Center(child: CircularProgressIndicator()),
  );
}