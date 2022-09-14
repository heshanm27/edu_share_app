import 'dart:developer';

import 'package:edu_share_app/src/utills/shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth_screen/signin_screen/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    AppSharedPreferences.setonBoardingState(false);
    AppSharedPreferences.setWelcomeScreenState(false);
    var OnBoardState  = AppSharedPreferences.GetonBoardingState();
    log("Shareprefvalue $OnBoardState");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column(
              children:[
                Text("WelcomeScreen"),
                SizedBox(height: 20),
                TextButton(onPressed:()=> Get.off(()=>SignIn()) , child: Text("SignIn Screen"))
              ]
          ),
        )
    );
  }


}
