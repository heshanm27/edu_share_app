import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:edu_share_app/src/custom_widget/custom_button/custom_button.dart';
import 'package:edu_share_app/src/custom_widget/custom_headline_text/custom_headline_text.dart';
import 'package:edu_share_app/src/screens/auth_screen/signup_screen/user_role_select/user_role_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/images/images.dart';
import '../../../constants/text/text.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  void initState() {
    super.initState();
    AppSharedPreferences.setonBoardingState(false);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
      ),
        body:SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal:20.w),
              child: SingleChildScrollView(
                child: Form(
                  child:  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(tLogo),
                        radius: 40.r,
                      ),
                      SizedBox(height:20.h),
                      CustomHeadlineText(text: "Edu Share",textColor: tPrimaryColor,textSize: 32.sp,),
                      SizedBox(height:10.h),
                      Text(
                        tSignInScreenText,style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height:60.h),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height:34.h),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height:60.h),
                      CustomButton(BtnText: "Sign In", onPressed: ()=>{}),
                      SizedBox(height:30.h),
                      TextButton(onPressed: ()=>{}, child: Text("Forgot Password ?", style:TextStyle(
                        fontSize: 14.sp
                      )),style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size.fromHeight(40.h)),

                      ),
                      
                      ),
                      SizedBox(height:20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account yet?"),
                          TextButton(onPressed: ()=>{
                            Get.to(UserRoleSelect())
                          }, child: Text("Create an account", style:TextStyle(
                              fontSize: 14.sp
                          ))),
                        ],
                      )
                    ],
                  )
                ),
              )
          ),
        )
    );
  }


}
