import 'package:edu_share_app/src/controllers/on_board_controller/on_board_controller.dart';
import 'package:edu_share_app/src/startup_widgets/welcome_screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/colors/colors.dart';

class OnBoardingScreen extends StatelessWidget {

  const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final onBoardController = OnBoardController();
    return Scaffold(
      body:Stack(
        alignment:Alignment.center,
          children: [
            LiquidSwipe(pages:onBoardController.pages,
            enableSideReveal: true,
            liquidController:onBoardController.controller,
            onPageChangeCallback:onBoardController.onPageChangedCallBack ,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.liquidReveal,
      ),

            Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () => onBoardController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: tDarkColor, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => onBoardController.skip(),
                child: const Text("Skip", style: TextStyle(color: Colors.grey)),
              ),
            ),
            Obx(
                  () => Positioned(
                bottom: 10,
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
