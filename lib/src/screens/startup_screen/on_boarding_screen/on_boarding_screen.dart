import 'dart:math';

import 'package:edu_share_app/src/controllers/on_board_controller/on_board_controller.dart';
import 'package:edu_share_app/src/custom_widget/custom_button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override

  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onBoardController = OnBoardController();

  @override
  void initState() {
debugPrint(onBoardController.lastPage.value.toString());
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:Stack(
        alignment:Alignment.center,
          children: [
            Obx(
              () => LiquidSwipe(pages:onBoardController.pages,
              enableSideReveal:true,
              liquidController:onBoardController.controller,
              onPageChangeCallback:onBoardController.onPageChangedCallBack ,
              slideIconWidget:onBoardController.lastPage.value == true ? null: Icon(Icons.arrow_back_ios),
              enableLoop: false,
              waveType: WaveType.liquidReveal,

      ),
            ),

            Positioned(
              bottom: 40.0.h,
              child:CustomButton(BtnText: "Get Started",onPressed: (){})
            ),
            Positioned(
              top: 50.h,
              right: 20.w,
              child: TextButton(
                onPressed: () => onBoardController.skip(),
                child: const Text("Skip", style: TextStyle(color: Colors.grey)),
              ),
            ),
            Obx(
                  () => Positioned(
                bottom: 10.h,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: onBoardController.curruntPage.value,
                  effect: const WormEffect(
                    activeDotColor: Color(0xff272727),
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }


}
