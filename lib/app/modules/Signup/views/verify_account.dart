import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class VerifyAccount extends GetView<SignupController> {
  VerifyAccount({super.key});

  final dataFromSignup = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "تأكيد الحساب",
                style: TextStyle(fontSize: 22, fontFamily: Appfonts.boldFont),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "قم بكتابة رمز التحق المرسل لك في الرسالة النصية",
                style: TextStyle(fontSize: 12, color: appColors.textColor),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                fieldWidth: 40,
                borderWidth: 1.5,
                autoFocus: true,
                fieldHeight: 50,
                borderColor: appColors.borderColor,
                focusedBorderColor: appColors.mainColor,
                enabledBorderColor: appColors.borderColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.otpCode = verificationCode;
                }, // end onSubmit
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => InkWell(
                    onTap: () => controller.verifyOtp(dataFromSignup["phone"]),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Button(
                            title: "تأكيد",
                            raduis: 16,
                            Btncolor: appColors.secondColor,
                          ),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
