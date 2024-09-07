import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetpasswordController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController phoneController = TextEditingController();

  RxBool isLoading = false.obs;
  void forgetPassword() async {
    isLoading.value = true;
    final phone = phoneController.text.trim();

    try {
      final result = await _authRepository.forgetPassword(
        phone,
      );
      print(result);
      // success
      if (result["message"] != null) {
        isLoading.value = false;
        showPopup(result["message"]);
        // Get.offAllNamed(Routes.HOME);
      }
      // failed
      else if (result["error"] != null) {
        isLoading.value = false;
        showPopup(result["error"]);
        // failed
      } else {
        isLoading.value = false;
        showPopup(result["error"]);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  void showPopup(String result) {
    Get.defaultDialog(
      title: "حدث خطأ !",
      barrierDismissible: false,
      titleStyle: const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
      middleText: result,
      middleTextStyle: const TextStyle(fontSize: 11),
      textCancel: "الغاء",
      radius: 8,
      onCancel: () {
        // Action to perform when cancel is tapped
        Get.back(); // Close the dialog
      },
    );
  }
}
