import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusUnit extends StatelessWidget {
  const BusUnit({super.key, this.controller});

  final controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 0),
                color: Color.fromRGBO(146, 143, 143, 0.16),
                blurRadius: 2,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    imageUrl:
                        "https://osabus.com/wp-content/uploads/2022/09/49-MAN-1024x768.jpeg",
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 80,
                    height: 22,
                    decoration: BoxDecoration(
                        color: appColors.mainColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                      child: Text(
                        "متاح للحجز",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: Appfonts.meduimFont,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: Text(
                "أتوبيس مرسيدس كبير",
                style: TextStyle(
                    fontFamily: Appfonts.boldFont,
                    color: appColors.secondColor,
                    fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      Text(
                        "45 راكب",
                        style: TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.mainFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bus_alert_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "55 مقعد",
                        style: TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.mainFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.speed_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "165 كم/س",
                        style: TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.mainFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.TRANSPORT_DETAILS),
              child: const Center(
                  child: Button(
                title: "عرض التفاصيل",
                raduis: 12,
              )),
            )
          ],
        ),
      ),
    );
  }
}
