import 'package:baraka_trans/app/modules/main/controllers/main_controller.dart';
import 'package:baraka_trans/app/modules/my_profile_detials/controllers/my_profile_detials_controller.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyProfileDetialsView extends GetView<MyProfileDetialsController> {
  const MyProfileDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());
    mainController.fetchUserData();
    controller.nameController.text = mainController.userData.value.name;
    controller.phoneController.text = mainController.userData.value.phone;
    controller.emailController.text = mainController.userData.value.email;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            color: appColors.secondColor,
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: const Text(
          'تفاصيل الحساب',
          style: TextStyle(fontFamily: Appfonts.boldFont),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Obx(
                  () => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: appColors.secondColor),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: controller.imageFile!.value.path.isEmpty
                            ? NetworkImage(
                                "http://192.168.1.80:8000/uploads/${mainController.userData.value.image}")
                            : FileImage(controller.imageFile!.value),
                      ),
                      color: appColors.mainColor,
                    ),
                  ),
                )),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () => controller.pickImage(),
                  child: const Text(
                    "تغيير الصورة الشخصية",
                    style: TextStyle(
                        fontSize: 12, decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 15),
                textField(
                  hint_text: mainController.userData.value.name,
                  type: TextInputType.text,
                  textFieldController: controller.nameController,
                  icon: const Icon(
                    IconlyLight.edit,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 12),
                textField(
                  hint_text: mainController.userData.value.phone,
                  textFieldController: controller.phoneController,
                  type: TextInputType.number,
                  icon: const Icon(
                    IconlyLight.call,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 12),
                textField(
                  hint_text: mainController.userData.value.email,
                  type: TextInputType.emailAddress,
                  textFieldController: controller.emailController,
                  icon: const Icon(
                    IconlyLight.document,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Obx(() => GestureDetector(
                        onTap: () => controller.updateProfile(),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: appColors.secondColor,
                              )
                            : const Button(
                                title: "حفظ البيانات",
                                raduis: 16,
                                Btncolor: appColors.secondColor,
                              ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
