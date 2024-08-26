import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/saved_transportations_controller.dart';

class SavedTransportationsView extends GetView<SavedTransportationsController> {
  const SavedTransportationsView({super.key});
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
          'المحفوظات',
          style: TextStyle(fontFamily: Appfonts.boldFont),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
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
                              width: 60,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: appColors.mainColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  "متاح للحجز",
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
                            "باص كبير مرسيدس بينز",
                            style: TextStyle(
                                color: appColors.mainColor,
                                fontSize: 14,
                                fontFamily: Appfonts.boldFont),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                IconlyLight.user_1,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Center(
                                child: Text(
                                  "55 راكب",
                                  style: TextStyle(
                                      fontSize: 11,
                                      // color: appColors.mainColor,
                                      fontFamily: Appfonts.meduimFont),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(IconlyLight.user,
                                  size: 16, color: appColors.textColor),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "50 مقعد",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: Appfonts.meduimFont,
                                  // color: appColors.mainColor
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(IconlyLight.location,
                                  size: 16, color: appColors.textColor),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "10 مسارات",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: Appfonts.meduimFont,
                                  // color: appColors.mainColor
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const InkWell(
                      child: Icon(
                    Icons.bookmark,
                    size: 26,
                    color: appColors.textColor,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
