import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

final OnboardingController control = Get.put(OnboardingController());

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        body(),
        buildDots(),
        button(context),
      ],
    ));
  }
}

//Body
Widget body() {
  return Expanded(
    child: Center(
      child: PageView.builder(
          controller: control.pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) {
            control.currentIndex.value = value;
          },
          itemCount: control.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Images
                  Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: appColors.borderColor)
                          ],
                          color: appColors.secondColor,
                          borderRadius: BorderRadius.circular(500)),
                      child: Image.asset(
                        control.items[index].image,
                        width: 350,
                        height: 350,
                      )),

                  const SizedBox(height: 30),
                  //Titles
                  Text(
                    control.items[index].title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: appColors.mainColor,
                      fontFamily: Appfonts.boldFont,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  //Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      control.items[index].description,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: Appfonts.lightFont),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    ),
  );
}

//Dots
Widget buildDots() {
  return Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            control.items.length,
            (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: control.currentIndex.value == index
                      ? appColors.secondColor
                      : const Color.fromARGB(255, 70, 69, 69),
                ),
                height: 7,
                width: control.currentIndex.value == index ? 30 : 7,
                duration: const Duration(milliseconds: 500))),
      ));
}

//Button
Widget button(BuildContext context) {
  return Obx(() => Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: control.currentIndex.value == control.items.length - 1
              ? appColors.secondColor
              : appColors.mainColor),
      child: TextButton(
        onPressed: () {
          if (control.currentIndex.value == control.items.length - 1) {
            control.doneButton();
          } else {
            control.pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut);
          }
        },
        child: Text(
          control.currentIndex.value == control.items.length - 1
              ? "بدء الاستخدام"
              : "التالي",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: Appfonts.mainFont),
        ),
      )));
}
