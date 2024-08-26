import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  const ForgetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: appColors.secondColor,
        //   title: const Text(
        //     'هل نسيت كلمة المرور',
        //     style: TextStyle(
        //         fontFamily: Appfonts.boldFont,
        //         color: Colors.white,
        //         fontSize: 26),
        //   ),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "استراجع حسابك",
                style: TextStyle(fontSize: 22, fontFamily: Appfonts.boldFont),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "يمكنك استرجاع حسابك من خلال ارسال كود تحقق",
                style: TextStyle(fontSize: 12, color: appColors.textColor),
              ),
              const SizedBox(
                height: 30,
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
                height: 50,
              ),
              const Button(
                title: "ارسال رمز",
                raduis: 16,
                Btncolor: appColors.secondColor,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    " هل ترغب في تسجيل الدخول ؟",
                    style:
                        TextStyle(fontSize: 12, fontFamily: Appfonts.lightFont),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () => Get.offAllNamed(Routes.LOGIN),
                    child: const Text(
                      "تسجيل الدخول ",
                      style: TextStyle(
                        color: appColors.mainColor,
                        fontFamily: Appfonts.meduimFont,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
