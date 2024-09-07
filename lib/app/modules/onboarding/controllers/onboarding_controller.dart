import 'package:baraka_trans/app/data/onboardinginfo.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  // ==================================
  final pageController = PageController();
  RxInt currentIndex = 0.obs;
  final box = GetStorage();
  final value = false.obs;
  final isSignedIn = false.obs;

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

  // init getStorage box

  @override
  void onInit() {
    value.value = box.read("splash_end") ?? false;
    box.write("splash_end", value.value);
    print(value.value);
    isSigned();
    update();
    super.onInit();
  }

  void isSigned() {
    if (box.read("token") == "SignedOut" || box.read("token") == null) {
      isSignedIn.value = false;
    } else {
      isSignedIn.value = true;
    }
    print(isSignedIn.value);
  }

  // onboarding DoneButton
  void doneButton() {
    Get.offNamed(Routes.LOGIN);
    box.write("splash_end", true);
    value.value = box.read("splash_end");
    update();
  }
}
