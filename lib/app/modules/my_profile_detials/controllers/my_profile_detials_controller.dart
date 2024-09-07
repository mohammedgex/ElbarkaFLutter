import 'dart:io';

import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileDetialsController extends GetxController {
  Rx<File>? imageFile = Rx<File>(File(""));
  final ImagePicker _picker = ImagePicker();

  // controllers

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Method to pick an image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile!.value = File(pickedFile.path);
    }
  }

  RxBool isLoading = false.obs;
  final AuthRepository _authRepository = AuthRepository();

  void updateProfile() async {
    isLoading.value = true;
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();

    try {
      final result = await _authRepository.updateProfile(name, phone, email);
      if (result["success"]) {
        isLoading.value = false;
        Get.back();
      } else {
        isLoading.value = false;
        Get.defaultDialog(
          title: "حدث خطأ !",
          barrierDismissible: false,
          titleStyle:
              const TextStyle(fontSize: 18, fontFamily: Appfonts.boldFont),
          middleText: "لم يتم تحديث البيانات بنجاح",
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
      print("erro");
      isLoading.value = false;
    }
  }
}
