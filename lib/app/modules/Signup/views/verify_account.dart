import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class VerifyAccount extends GetView<SignupController> {
  const VerifyAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: appColors.secondColor,
        //   elevation: 0,
        //   scrolledUnderElevation: 0,
        //   title: const Text(
        //     'تأكيد الحساب',
        //     style: TextStyle(
        //         fontSize: 26,
        //         fontFamily: Appfonts.boldFont,
        //         color: Colors.white),
        //   ),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24),
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
                numberOfFields: 4,
                fieldWidth: 50,
                borderWidth: 2,
                autoFocus: true,
                fieldHeight: 50,
                borderColor: appColors.borderColor,
                focusedBorderColor: appColors.mainColor,
                enabledBorderColor: appColors.borderColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              const SizedBox(
                height: 20,
              ),
              const Button(
                title: "تأكيد",
                raduis: 16,
                Btncolor: appColors.secondColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
