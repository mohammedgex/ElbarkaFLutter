import 'package:baraka_trans/app/data/onboardinginfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // ==================================
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "التنوع في فئات حافلاتنا",
        description: "حافلات مهيئة بمقاعد مريحة ومقابض علوية",
        image: "assets/bus.png"),
    OnboardingInfo(
        title: "فخامة تفاصيلها، وراحة مقاعدها",
        description:
            "توفر ثلاثة أبواب في كل حافلة وذلك لضمان سهولة صعود ونزول الركاب مع مراعاة المدخل الخلفي الخاص بالعائلات.",
        image: "assets/bus2.png"),
    OnboardingInfo(
        title: "رضا عملائنا، فهو ما نراهن عليه دائماً وأبداً",
        description:
            "تخصيص مجموعة من الحافلات مجهزة لذوي الاحتياجات الخاصة لتسهيل استخدام وسائل النقل العام بكل يسر وسهولة.",
        image: "assets/bus3.png"),
  ];

  // =====================================
}
