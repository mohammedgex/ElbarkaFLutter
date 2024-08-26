import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/paymentmethods_controller.dart';

class PaymentStatusView extends GetView<PaymentmethodsController> {
  PaymentStatusView({
    super.key,
  });

  final statusType = Get.arguments["paymentStatus"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // for success or failed operation
                ScaleTransition(
                  scale: controller.animation,
                  child: statusType!
                      ? Image.asset(
                          "assets/checked.png",
                          width: 150,
                          height: 150,
                        )
                      : Image.asset(
                          "assets/cancel.png",
                          width: 150,
                          height: 150,
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  statusType!
                      ? "تمت عملية الدفع الخاصة بك بنجاح"
                      : "فشلت عملية الدفع الخاصة بك",
                  style: const TextStyle(
                      fontSize: 18, fontFamily: Appfonts.boldFont),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "ستظهر عمليات الدفع الخاصة بك في المدفوعات",
                  style: TextStyle(
                      fontFamily: Appfonts.mainFont,
                      fontSize: 11,
                      color: appColors.textColor),
                ),
              ],
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: appColors.textColor),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "طريقة الدفع :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "دفع الكتروني",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.secondColor),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المبلغ بالجنية :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "40000 جنية",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.secondColor),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المبلغ بالريال :",
                          style: TextStyle(
                              fontSize: 12, fontFamily: Appfonts.mainFont),
                        ),
                        Text(
                          "2000 ريال",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              fontSize: 13,
                              color: appColors.secondColor),
                        ),
                      ],
                    ),
                    statusType!
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تاريخ الدفع :",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: Appfonts.mainFont),
                              ),
                              Text(
                                "15/06/2024",
                                style: TextStyle(
                                    fontFamily: Appfonts.meduimFont,
                                    fontSize: 13,
                                    color: appColors.secondColor),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () => Get.offAllNamed(Routes.RESERVATION),
              child: const Button(
                Btncolor: appColors.secondColor,
                title: "الرجوع للرئيسية",
                raduis: 12,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
