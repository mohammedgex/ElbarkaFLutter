import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/paymentmethods_controller.dart';

class PaymentmethodsView extends GetView<PaymentmethodsController> {
  const PaymentmethodsView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    controller.reservationId = args["reservationId"];
    controller.amountEGP = args["amountEGP"];
    controller.amountSR = args["amountSR"];
    print(args["reservationId"]);
    controller.pay();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'طرق الدفع',
            style: TextStyle(fontSize: 18),
          ),
          leading: InkWell(
            onTap: () {
              Get.defaultDialog(
                title: "هل انت متأكد من الالغاء ؟",
                titleStyle: const TextStyle(
                    fontSize: 16, fontFamily: Appfonts.meduimFont),
                middleText: "سيتم الغاء حجزك اذا قمت بالخروج من هذه الصفحة.",
                middleTextStyle: const TextStyle(fontSize: 12),
                textConfirm: "تأكيد",
                textCancel: "الغاء",
                radius: 12,
                onConfirm: () {
                  Get.offAllNamed(Routes.HOME); // Close the dialog
                },
                onCancel: () {
                  // Action to perform when cancel is tapped
                  Get.back(); // Close the dialog
                },
              );
            },
            child: const Icon(
              Icons.cancel_rounded,
              color: appColors.secondColor,
              size: 40,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ...List.generate(controller.paymentMedthods.length, (index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      if (controller.paymentKey != null) {
                        Get.toNamed(Routes.PAYMOB_PAYMENT, arguments: {
                          "isTransfer": args["isTransfer"] ?? false
                        });
                      }
                    } else if (index == 1) {
                      Get.toNamed(Routes.SELF_PAYMENT);
                    } else if (index == 2) {
                      Get.toNamed(Routes.PERSON_PAYMENT);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColors.secondColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "${controller.paymentMedthods[index]["icon"]}",
                              color: appColors.secondColor,
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              controller.paymentMedthods[index]["name"],
                              style: const TextStyle(
                                  fontFamily: Appfonts.meduimFont),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        )));
  }
}
