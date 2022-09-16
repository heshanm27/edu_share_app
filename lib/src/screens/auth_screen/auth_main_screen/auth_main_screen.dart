import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:edu_share_app/src/constants/images/images.dart';
import 'package:edu_share_app/src/custom_widget/custom_button/custom_button.dart';
import 'package:edu_share_app/src/custom_widget/custom_headline_text/custom_headline_text.dart';
import 'package:edu_share_app/src/screens/auth_screen/signin_screen/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/text/text.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';

class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({Key? key}) : super(key: key);

  @override
  State<AuthMainScreen> createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen> {
  @override
  void initState() {
    super.initState();
    AppSharedPreferences.setonBoardingState(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.w),
          margin: EdgeInsets.only(top: 44.h, bottom: 44.h),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:15.h,
              ),
              Image.asset(tAuthMainScreenImage),
              SizedBox(
                height: 42.h,
              ),
              CustomHeadlineText(text: "Welcome !", textColor: tPrimaryColor),
              SizedBox(
                height: 42.h,
              ),
              Text(
                tAuthScreenText,style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomButton(
                  BtnText: 'Sign In', onPressed: () => Get.off(SignIn())),
              SizedBox(
                height: 42.h,
              ),
              OutlinedButton.icon(
                  label:SizedBox(),
                  icon: Text('Sign Up'),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(5.h),
                      minimumSize: Size.fromHeight(45.h),
                      side: BorderSide(color: tPrimaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      )),
                  onPressed: () => {})
            ],
          ),
        ),
      ),
    );
  }
}
