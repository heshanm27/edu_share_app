


import 'dart:io';

import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../custom_widget/custom_headline_text/custom_headline_text.dart';
import '../../../../custom_widget/custom_profileImage/custom_profileImage.dart';

class OrgSignUp extends StatefulWidget {
  const OrgSignUp({Key? key}) : super(key: key);

  @override
  State<OrgSignUp> createState() => _OrgSignUpState();
}

class _OrgSignUpState extends State<OrgSignUp> {
  int currentStep = 0;
  final AccountFormKey = GlobalKey<FormState>();
  final organizationName = TextEditingController();
  File? _image;

  Future getImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return ;
      setState(() {
        _image = File(image.path);
        print('Image Path $_image');
      });

    }on PlatformException catch(e){
      print('Failed to pick image:$e');
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      backgroundColor:Colors.transparent,
      elevation: 0,
      
    ),
      body: SafeArea(
        child: Stepper(
          currentStep: currentStep,
            elevation: 0,
            onStepCancel: (){
              if(currentStep > 0 ){
                setState(() => currentStep -= 1);
              }
            },
            onStepContinue: (){
            final isLastStep = currentStep == getSteps().length -1;
            final isAccountFormValid = AccountFormKey.currentState!.validate();
            if(isLastStep){

            }else{
              if(currentStep == 0 && isAccountFormValid ){
                setState(() => currentStep += 1);
              }
            }

            },
            type: StepperType.horizontal,
            steps: getSteps()),
      ),

    );
  }


  List<Step> getSteps() =>[
    Step(title: Text("Account Details"),isActive: currentStep >= 0, content:Form(
      key: AccountFormKey,
      child: Column(
        children: [

          CustomHeadlineText(text:"Account Details",textSize: 20.sp,textColor:tPrimaryColor ),
          SizedBox(height:20.h),
          CustomProfileImage(onPressed:getImage,imagePath:_image == null ? 'https://images.unsplash.com/photo-1665172653767-795eb690da50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80':'',imageFile:_image != null ? _image : null,isNetWorkImage:_image != null ? false : true ),
          SizedBox(height:20.h),
          TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return  "Please Enter Value";
              }else{
                return null;
              }
            },
              controller: organizationName,
              decoration:InputDecoration(labelText: 'Email')
          ),
          SizedBox(height:20.h),
          TextFormField(

              controller: organizationName,
              decoration:InputDecoration(labelText: 'Password,')
          ),
          SizedBox(height:20.h),
          TextFormField(
              controller: organizationName,
              decoration:InputDecoration(labelText: 'Confirm Password')
          ),
        ],
      ),
    )),
    Step(title: Text("Basic Details"),isActive: currentStep >= 1, content:  Column(
      children: [
        TextFormField(
            controller: organizationName,
            decoration:InputDecoration(labelText: 'Organization Name')
        ),
        SizedBox(height:10.h),
        TextFormField(
            controller: organizationName,
            decoration:InputDecoration(labelText: 'Organization Short Name')
        ),
        SizedBox(height:10.h),
        TextFormField(
            controller: organizationName,
            decoration:InputDecoration(labelText: 'Contact No')
        ),
      ],
    )),
    // Step(title: Text("Details3"),isActive: currentStep >= 2, content: Container()),
  ];
}
