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
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24),
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
              const textField(
                hint_text: "رقم الهاتف الخاص بك",
                type: TextInputType.number,
                icon: Icon(
                  IconlyLight.call,
                  color: appColors.secondColor,
                ),
              ),
              const SizedBox(height: 20),
              const textField(
                hint_text: "كلمة المرور الخاصة بك",
                suffixIcon: Icon(
                  IconlyLight.show,
                  color: appColors.secondColor,
                ),
                icon: Icon(
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
              InkWell(
                onTap: () => Get.offAllNamed(Routes.HOME),
                child: const Button(
                  title: "دخول",
                  raduis: 16,
                  Btncolor: appColors.secondColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "هل ليس لديك حساب بعد ؟",
                    style:
                        TextStyle(fontSize: 12, fontFamily: Appfonts.lightFont),
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
    );
  }
}
