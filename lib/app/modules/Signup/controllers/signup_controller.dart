import 'dart:io';

import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  RxBool isLoading = false.obs;

  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController birthdateController = TextEditingController();

  final TextEditingController passportNumberController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  Rx<File>? imageFile = Rx<File>(File(""));

  String otpCode = '';

  // Method to pick an image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile!.value = File(pickedFile.path);
    }
  }

  void register() async {
    isLoading.value = true;
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final image = imageFile; // Assuming imageFile is a File object

    try {
      final result = await _authRepository.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image!.value,
      );

      if (result["success"]) {
        isLoading.value = false;
        Get.offAllNamed(Routes.VERIFYACCOUNT, arguments: {"phone": phone});
      } else if (result["error"] != null) {
        isLoading.value = false;
        Get.defaultDialog(
          title: "Error!",
          barrierDismissible: false,
          titleStyle:
              const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
          middleText: result["error"],
          middleTextStyle: const TextStyle(fontSize: 11),
          textCancel: "Cancel",
          radius: 8,
          onCancel: () {
            Get.back(); // Close the dialog
          },
        );
      } else {
        isLoading.value = false;
        Get.defaultDialog(
          title: "Error!",
          barrierDismissible: false,
          titleStyle:
              const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
          middleText: "Unknown error occurred",
          middleTextStyle: const TextStyle(fontSize: 11),
          textCancel: "Cancel",
          radius: 8,
          onCancel: () {
            Get.back(); // Close the dialog
          },
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to connect to the server");
    }
  }

  // verfiy otp
  void verifyOtp(String phone) async {
    isLoading.value = true;

    try {
      final result = await _authRepository.verifyOTP(phone, otpCode);
      if (result["token"] != null) {
        isLoading.value = false;
        Get.snackbar("تم بنجاح", "تم انشاء الحساب بنجاح");
        Get.offAllNamed(Routes.LOGIN);
      } else if (result["error"] != null) {
        isLoading.value = false;
        Get.defaultDialog(
          title: "حدث خطأ !",
          barrierDismissible: false,
          titleStyle: const TextStyle(
              fontSize: 18,
              fontFamily: Appfonts.boldFont,
              color: appColors.secondColor),
          middleText: result["error"],
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
          middleText: result["error"],
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
