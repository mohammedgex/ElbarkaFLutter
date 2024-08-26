import 'package:baraka_trans/app/modules/myreservations/controllers/myreservations_controller.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyreservationsController());

    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const []),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://media.wired.com/photos/5cf832279c2a7cd3975976ca/master/pass/Transpo_XcelsiorChargeCharging_TA.jpg"))),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      width: 30,
                      height: 20,
                      decoration: BoxDecoration(
                          color: appColors.mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "مؤكد",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: Appfonts.meduimFont,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "#104545",
                    style: TextStyle(
                        color: appColors.mainColor,
                        fontSize: 14,
                        fontFamily: Appfonts.meduimFont),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyLight.calendar,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Center(
                        child: Text(
                          "10-10-2024",
                          style: TextStyle(
                              fontSize: 11,
                              color: appColors.textColor,
                              fontFamily: Appfonts.meduimFont),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "جدة-مطار-المدينة-مطار",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: Appfonts.meduimFont,
                        color: appColors.textColor),
                  ),
                  Row(
                    children: [
                      Icon(IconlyLight.wallet,
                          size: 16, color: appColors.textColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "3000 ر.س",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: Appfonts.meduimFont,
                            color: appColors.textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          InkWell(
              onTap: () => controller.viewMore(context),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 26,
              ))
        ],
      ),
    );
  }
}
