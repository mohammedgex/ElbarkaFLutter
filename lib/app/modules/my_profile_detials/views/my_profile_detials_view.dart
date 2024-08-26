import 'package:baraka_trans/app/modules/my_profile_detials/controllers/my_profile_detials_controller.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyProfileDetialsView extends GetView<MyProfileDetialsController> {
  const MyProfileDetialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: appColors.secondColor),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg"),
                      ),
                      color: appColors.mainColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "تغيير الصورة الشخصية",
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 15),
                const textField(
                  hint_text: "الاسم الاول",
                  type: TextInputType.text,
                  icon: Icon(
                    IconlyLight.edit,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 12),
                const textField(
                  hint_text: "الاسم الثاني",
                  type: TextInputType.text,
                  icon: Icon(
                    IconlyLight.edit,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 12),
                const textField(
                  hint_text: "رقم الهاتف الخاص بك",
                  type: TextInputType.number,
                  icon: Icon(
                    IconlyLight.call,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 12),
                const textField(
                  hint_text: "البريد الالكتروني الخاص بك",
                  type: TextInputType.emailAddress,
                  icon: Icon(
                    IconlyLight.document,
                    color: appColors.secondColor,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.VERIFYACCOUNT),
                    child: const Button(
                      title: "حفظ البيانات",
                      raduis: 16,
                      Btncolor: appColors.secondColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
