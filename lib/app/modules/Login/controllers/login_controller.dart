import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  final storage = GetStorage();

  void login() async {
    isLoading.value = true;
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    try {
      final result = await _authRepository.login(phone, password);
      if (result["token"] != null) {
        isLoading.value = false;
        storage.write("token", result["token"]);
        Get.offAllNamed(Routes.HOME);
      } else if (result["message"] != null) {
        isLoading.value = false;
        Get.defaultDialog(
          title: "حدث خطأ !",
          barrierDismissible: false,
          titleStyle:
              const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
          middleText: result["message"],
          middleTextStyle: const TextStyle(fontSize: 11),
          textCancel: "الغاء",
          radius: 8,
          onCancel: () {
            // Action to perform when cancel is tapped
            Get.back(); // Close the dialog
          },
        );
      } else {
        isLoading.value = false;
        Get.defaultDialog(
          title: "حدث خطأ !",
          barrierDismissible: false,
          titleStyle:
              const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
          middleText: result["message"],
          middleTextStyle: const TextStyle(fontSize: 11),
          textCancel: "الغاء",
          radius: 8,
          onCancel: () {
            // Action to perform when cancel is tapped
            Get.back(); // Close the dialog
          },
        );
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
