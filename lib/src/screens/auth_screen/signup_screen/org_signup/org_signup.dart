import 'dart:io';

import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:email_validator/email_validator.dart';
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
  final BasicDetailFormKey = GlobalKey<FormState>();

  final Email = TextEditingController();
  final Password = TextEditingController();
  final ConfirmPassword = TextEditingController();
  final OrganizationName = TextEditingController();
  final OrganizationShortName = TextEditingController();
  final Address = TextEditingController();
  final PhoneNo = TextEditingController();

  var IsPasswordVisible = true;
  File? _image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
        print('Image Path $_image');
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    Email.dispose();
    Password.dispose();
    ConfirmPassword.dispose();
    OrganizationName.dispose();
    OrganizationShortName.dispose();
    Address.dispose();
    PhoneNo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context)
              .copyWith(colorScheme: ColorScheme.light(primary: tPrimaryColor)),
          child: Stepper(
              currentStep: currentStep,
              elevation: 0,
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() => currentStep -= 1);
                }
              },
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                final isAccountFormValid =
                    AccountFormKey.currentState!.validate();
                if (isLastStep) {
                } else {
                  if (currentStep == 0 && isAccountFormValid) {
                    setState(() => currentStep += 1);
                  }
                }
              },
              controlsBuilder:
                  (BuildContext context, ControlsDetails controllers) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Row(children: <Widget>[
                        if (currentStep == 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controllers.onStepContinue,
                              child: const Text('NEXT'),
                            ),
                          ),
                      ]),
                      Column(children: [
                        Row(
                          children: [
                            if (currentStep == 1)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: controllers.onStepContinue,
                                  child: const Text('Complete Sign Up'),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            if (currentStep == 1)
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onPressed: controllers.onStepCancel,
                                  child: const Text('Back'),
                                ),
                              ),
                          ],
                        ),
                      ])
                    ],
                  ),
                );
              },
              type: StepperType.horizontal,
              steps: getSteps()),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            title: Text("SetUp Account"),
            isActive: currentStep >= 0,
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Form(
              key: AccountFormKey,
              child: Column(
                children: [
                  CustomHeadlineText(
                      text: "Account Details",
                      textSize: 20.sp,
                      textColor: tPrimaryColor),
                  SizedBox(height: 20.h),
                  CustomProfileImage(
                      onPressed: getImage,
                      imagePath: _image == null
                          ? 'https://images.unsplash.com/photo-1665172653767-795eb690da50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
                          : '',
                      imageFile: _image != null ? _image : null,
                      isNetWorkImage: _image != null ? false : true),
                  SizedBox(height: 20.h),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty)
                           {
                          return "Please Enter  Email";
                        }else if(!EmailValidator.validate(value)){
                          return "Please Enter Valid Email";
                        } else {
                          return null;
                        }
                      },
                      controller: Email,
                      decoration: InputDecoration(labelText: 'Email')),
                  SizedBox(height: 20.h),
                  PasswordTexInput(
                      IsPasswordVisible,
                      'Password',
                      Password,
                      () => setState(() {
                            IsPasswordVisible = !IsPasswordVisible;
                          }),
                          (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    } else {
                      return null;
                    }
                  }),
                  SizedBox(height: 20.h),
                  PasswordTexInput(IsPasswordVisible,'Confirm Password',ConfirmPassword, () => setState(() {
                    IsPasswordVisible = !IsPasswordVisible;
                  }),(value) {
                    if (value!.isEmpty) {
                      return "Please Enter Confirm Password";
                    }else if(value != Password.text){
                      return "Password and Confirm Password mismatch";
                    } else {
                      return null;
                    }
                  } ),
                  SizedBox(height: 20.h),
                ],
              ),
            )),
        Step(
            title: Text("Basic Details"),
            isActive: currentStep >= 1,
            content: Form(
              key: BasicDetailFormKey,
              child: Column(
                children: [
                  TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      controller: OrganizationName,
                      decoration:
                          InputDecoration(labelText: 'Organization Name')),
                  SizedBox(height: 20.h),
                  TextFormField(
                      controller: OrganizationShortName,
                      decoration: InputDecoration(
                          labelText: 'Organization Short Name')),
                  SizedBox(height: 20.h),
                  TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: PhoneNo,
                      decoration: InputDecoration(labelText: 'Contact No')),
                  SizedBox(height: 20.h),
                  TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: Address,
                      decoration: InputDecoration(labelText: 'Address')),
                ],
              ),
            )),
        // Step(title: Text("Details3"),isActive: currentStep >= 2, content: Container()),
      ];

  Widget PasswordTexInput(
      bool IsPasswordVisible,
      String label,
      TextEditingController controller,
      VoidCallback onPressed,
      String? Function(String?) validateFunction) {
    return TextFormField(
        obscureText: IsPasswordVisible,
        validator: validateFunction,
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: IsPasswordVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )));
  }
}
