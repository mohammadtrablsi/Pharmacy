import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/imageassets.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/Auth/onBoarding/onBoardingController.dart';
import '../../widget/onBoarding/onBoardingButtonPart.dart';
import '../../widget/in common/animatedPoints.dart';

import '../../widget/onBoarding/pageInOnBoarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<OnBoardingController>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView(
                  onPageChanged: ((value) {
                    controller.setIndex(value);
                  }),
                  controller: controller.pageController,
                  children: const [
                    PageInOnBoarding(
                      image: AppImageAsset.onBoarding11,
                      text:
                          "Welcome to Pharmacy we’re \n  excited to have you onboard",
                      heightOfImage: 36,
                    ),
                    PageInOnBoarding(
                      image: AppImageAsset.onBoarding12,
                      text:
                          "here you can search, buy ,and \n get all kinds of medicines locally",
                      heightOfImage: 32,
                    ),
                    PageInOnBoarding(
                      image: AppImageAsset.onBoarding13,
                      text:
                          "now lets get you started to begin \n your journey with us",
                      heightOfImage: 36,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  AnimatedPoints(
                    indexPage: controller.indexPage,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  OnBoardingButtonsPart(
                    text: 'Continue',
                    transport: () {
                      controller.transport();
                    },
                    index: controller.indexPage,
                    goToRegister: () => controller.goToRegister(),
                    skip: () => controller.skip(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
