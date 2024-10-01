import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/profileBtns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/myprofile_controller.dart';

class MyprofileView extends GetView<MyprofileController> {
  const MyprofileView({super.key});
  @override
  Widget build(BuildContext context) {
    final MyprofileController mainController = Get.put(MyprofileController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('حسابي'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // first section
                Column(
                  children: [
                    // profile image
                    mainController.isloading!.value
                        ? Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                color: appColors.borderColor),
                          )
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://6874-188-40-217-164.ngrok-free.app/storage/${mainController.userData.value.image}"))),
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                    // username
                    mainController.isloading!.value
                        ? Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColors.borderColor),
                          )
                        : Text(
                            mainController.userData.value.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                    const SizedBox(
                      height: 45,
                    ),
                    // buttons
                    Column(
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed(Routes.MY_PROFILE_DETIALS),
                          child: const Profilebtns(
                            title: "تفاصيل شخصية",
                            icon: Icon(
                              IconlyLight.user,
                              color: appColors.secondColor,
                              size: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.MYRESERVATIONS),
                          child: const Profilebtns(
                            title: "حجوزرات الدورات",
                            icon: Icon(
                              IconlyLight.bookmark,
                              color: appColors.secondColor,
                              size: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.TRANSFERS),
                          child: const Profilebtns(
                            title: "حجوزرات التوصيلات",
                            icon: Icon(
                              IconlyLight.bookmark,
                              color: appColors.secondColor,
                              size: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "هل انت متأكد من تسجيل الخروج ؟",
                              titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: Appfonts.meduimFont),
                              middleText:
                                  "سيتم توجيهك الي صفحة تسجيل الدخول مرة اخري",
                              middleTextStyle: const TextStyle(
                                  fontSize: 10, fontFamily: Appfonts.lightFont),
                              textConfirm: "تأكيد",
                              textCancel: "الغاء",
                              radius: 12,
                              onConfirm: () {
                                Get.offAllNamed(
                                    Routes.LOGIN); // Close the dialog
                              },
                              onCancel: () {
                                // Action to perform when cancel is tapped
                                Get.back(); // Close the dialog
                              },
                            );
                          },
                          child: const Profilebtns(
                            title: "تسجيل الخروج",
                            icon: Icon(
                              IconlyLight.logout,
                              color: appColors.secondColor,
                              size: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // second section
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        "تواصل معنا",
                        style: TextStyle(color: appColors.textColor),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                color: appColors.mainColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              IconlyLight.call,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.CHAT_SUPPORT),
                            child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: appColors.mainColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  IconlyLight.message,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
