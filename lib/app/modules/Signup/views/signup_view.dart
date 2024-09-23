import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "انشاء حساب",
                      style: TextStyle(
                          fontSize: 24, fontFamily: Appfonts.boldFont),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "قم بتسجيل بياناتك لانشاء حساب جديد.",
                      style:
                          TextStyle(fontSize: 12, color: appColors.textColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Obx(() => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: controller
                                                .imageFile!.value.path.isEmpty
                                            ? const NetworkImage(
                                                "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg")
                                            : FileImage(
                                                    controller.imageFile!.value)
                                                as ImageProvider<Object>),
                                    color: appColors.mainColor),
                              )),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () => controller.pickImage(),
                                child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: appColors.secondColor,
                                        borderRadius:
                                            BorderRadius.circular(500)),
                                    child: const Icon(
                                      IconlyLight.plus,
                                      size: 18,
                                    )),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textField(
                      hint_text: "الاسم بالكامل",
                      type: TextInputType.text,
                      textFieldController: controller.nameController,
                      validation: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "تأكد من كتابة الاسم";
                      },
                      icon: const Icon(
                        IconlyLight.edit,
                        color: appColors.secondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    textField(
                      hint_text: "رقم الهاتف الخاص بك",
                      type: TextInputType.number,
                      textFieldController: controller.phoneController,
                      validation: (value) {
                        if (value!.length == 11) {
                          return null;
                        }
                        return "رقم الهاتف غير صحيح.";
                      },
                      icon: const Icon(
                        IconlyLight.call,
                        color: appColors.secondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    textField(
                      hint_text: " البريد الالكتروني الخاص بك",
                      type: TextInputType.emailAddress,
                      textFieldController: controller.emailController,
                      icon: const Icon(
                        IconlyLight.document,
                        color: appColors.secondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    textField(
                      hint_text: "كلمة المرور الخاصة بك",
                      textFieldController: controller.passwordController,
                      validation: (value) {
                        if (value!.length >= 8) {
                          return null;
                        }
                        return "يرجي كتابة كلمة مرور صحيحة";
                      },
                      suffixIcon: const Icon(
                        IconlyLight.show,
                        color: appColors.secondColor,
                      ),
                      icon: const Icon(
                        IconlyLight.password,
                        color: appColors.secondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    textField(
                      hint_text: "اعادة كلمة المرور الخاصة بك",
                      validation: (value) {
                        if (value! ==
                            controller.passwordController.text.trim()) {
                          return null;
                        }
                        return "يرجي اعادة كلمة المرور ";
                      },
                      suffixIcon: const Icon(
                        IconlyLight.show,
                        color: appColors.secondColor,
                      ),
                      icon: const Icon(
                        IconlyLight.password,
                        color: appColors.secondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: appColors.secondColor,
                                )
                              : const Button(
                                  title: "انشاء حساب",
                                  raduis: 16,
                                  Btncolor: appColors.secondColor,
                                ),
                        )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          " هل لديك حساب ؟",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.lightFont),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () => Get.offAllNamed(Routes.LOGIN),
                          child: const Text(
                            "تسجيل دخول ",
                            style: TextStyle(
                                color: appColors.mainColor,
                                fontFamily: Appfonts.meduimFont),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
