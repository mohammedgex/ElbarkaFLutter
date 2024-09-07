import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: Appfonts.boldFont,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "قم بتسجيل الدخول لاستخدام التطبيق.",
                  style: TextStyle(fontSize: 12, color: appColors.textColor),
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 20),
                textField(
                  hint_text: "كلمة المرور الخاصة بك",
                  validation: (value) {
                    if (value!.length >= 8) {
                      return null;
                    }
                    return "ير جي ادخال كلمة مرور لا تقل عن 8 حروف.";
                  },
                  textFieldController: controller.passwordController,
                  suffixIcon: const Icon(
                    IconlyLight.show,
                    color: appColors.secondColor,
                  ),
                  icon: const Icon(
                    IconlyLight.lock,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.FORGETPASSWORD),
                      child: const Text(
                        "هل نسيت كلمة المرور ؟",
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontFamily: Appfonts.lightFont,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                const SizedBox(height: 50),
                Obx(() => GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: appColors.secondColor,
                            )
                          : const Button(
                              title: "دخول",
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
                      "هل ليس لديك حساب بعد ؟",
                      style: TextStyle(
                          fontSize: 12, fontFamily: Appfonts.lightFont),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () => Get.offAllNamed(Routes.SIGNUP),
                      child: const Text(
                        "انشاء حساب",
                        style: TextStyle(
                          color: appColors.mainColor,
                          fontFamily: Appfonts.meduimFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
