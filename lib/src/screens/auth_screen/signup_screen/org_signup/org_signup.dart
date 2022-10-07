
import 'package:flutter/material.dart';

class OrgSignUp extends StatefulWidget {
  const OrgSignUp({Key? key}) : super(key: key);

  @override
  State<OrgSignUp> createState() => _OrgSignUpState();
}

class _OrgSignUpState extends State<OrgSignUp> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor:Colors.transparent,
      elevation: 0,
      
    ),
      body: Stepper(
        currentStep: currentStep,
          onStepContinue: (){
          final isLastStep = currentStep == getSteps().length -1;
          if(isLastStep){

          }else{
            setState(() => currentStep += 1);
          }

          },
          type: StepperType.horizontal,
          steps: getSteps()),

    );
  }


  List<Step> getSteps() =>[
    Step(title: Text("Details1"),isActive: currentStep >= 0, content: Container()),
    Step(title: Text("Details2"),isActive: currentStep >= 1, content: Container()),
    Step(title: Text("Details3"),isActive: currentStep >= 2, content: Container()),
  ];
}
