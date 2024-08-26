import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "انشاء حساب",
                    style:
                        TextStyle(fontSize: 24, fontFamily: Appfonts.boldFont),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "قم بتسجيل بياناتك لانشاء حساب جديد.",
                    style: TextStyle(fontSize: 12, color: appColors.textColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg")),
                              color: appColors.mainColor),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: appColors.secondColor,
                                    borderRadius: BorderRadius.circular(500)),
                                child: const Icon(
                                  IconlyLight.plus,
                                  size: 18,
                                )))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const textField(
                    hint_text: "الاسم الاول",
                    type: TextInputType.text,
                    icon: Icon(
                      IconlyLight.edit,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const textField(
                    hint_text: "الاسم الثاني",
                    type: TextInputType.text,
                    icon: Icon(
                      IconlyLight.edit,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const textField(
                    hint_text: "رقم الهاتف الخاص بك",
                    type: TextInputType.number,
                    icon: Icon(
                      IconlyLight.call,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const textField(
                    hint_text: " البريد الالكتروني الخاص بك",
                    type: TextInputType.emailAddress,
                    icon: Icon(
                      IconlyLight.document,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const textField(
                    hint_text: "كلمة المرور الخاصة بك",
                    suffixIcon: Icon(
                      IconlyLight.show,
                      color: appColors.secondColor,
                    ),
                    icon: Icon(
                      IconlyLight.password,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const textField(
                    hint_text: "اعادة كلمة المرور الخاصة بك",
                    suffixIcon: Icon(
                      IconlyLight.show,
                      color: appColors.secondColor,
                    ),
                    icon: Icon(
                      IconlyLight.password,
                      color: appColors.secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.VERIFYACCOUNT),
                    child: const Button(
                      title: "انشاء حساب",
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
        ));
  }
}
