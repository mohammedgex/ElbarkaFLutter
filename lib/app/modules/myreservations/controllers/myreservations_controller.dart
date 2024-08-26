import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyreservationsController extends GetxController {
  void viewMore(BuildContext context) {
    Get.bottomSheet(Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        height: MediaQuery.of(context).size.height * 1.5,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              IconlyLight.info_square,
              size: 50,
              color: appColors.mainColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: appColors.borderColor,
                    borderRadius: BorderRadius.circular(14)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "حالة الحجز :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "مقبول",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تاريخ الحجز :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "15/6/2024",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "طريقة الدفع :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "يدوي",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المبلغ الاجمالي :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "2200 ريال",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.mainColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(6),
                // height: 200,
                decoration: BoxDecoration(
                    color: appColors.borderColor,
                    borderRadius: BorderRadius.circular(14)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "نوع وسيلة النقل :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "مرسيدس بينز 89",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مسار النقل :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "جدة-مكة-المطار",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تاريخ الوصول :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "15-8-2024",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "نقطة الوصول :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "مطار المدينة",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "نقطة المغادرة :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "مطار جدة",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تاريخ المغادرة :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "22-8-2024",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "عدد الركاب :",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "50 راكب",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.mainColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () => showCancel(),
                  child: const Button(
                    title: "الغاء الحجز",
                    Btncolor: appColors.mainColor,
                    raduis: 8,
                  ),
                )),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                    child: Button(
                  title: "عرض الوسيلة",
                  Btncolor: appColors.secondColor,
                  raduis: 8,
                ))
              ],
            )
          ],
        ),
      ),
    ));
  }

  void showCancel() {
    Get.defaultDialog(
      title: "هل انت متأكد من الغاء الحجز ؟",
      titleStyle:
          const TextStyle(fontSize: 14, fontFamily: Appfonts.meduimFont),
      middleText:
          "في حالة الغاء الحجز سيقوم الفريق المختص بالتواصل معاك لارجاع المبلغ المدفوع",
      middleTextStyle: const TextStyle(fontSize: 10),
      textConfirm: "تأكيد",
      textCancel: "تراجع",
      radius: 12,
      onConfirm: () {
        Get.offAllNamed(Routes.HOME); // Close the dialog
      },
      onCancel: () {
        // Action to perform when cancel is tapped
        Get.back(); // Close the dialog
      },
    );
  }
}
