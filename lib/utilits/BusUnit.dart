import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusUnit extends StatelessWidget {
  const BusUnit(
      {super.key,
      this.controller,
      this.imageUrl,
      this.rdiersCount,
      this.seatsCount,
      this.speed,
      this.title,
      this.isAvailable,
      this.Images,
      this.description,
      this.features,
      this.routes,
      this.busId});

  final controller;
  final String? imageUrl;
  final String? rdiersCount;
  final String? seatsCount;
  final String? speed;
  final String? title;
  final bool? isAvailable;
  final List<String>? Images;
  final List<String>? features;
  final List<transRoutes>? routes;
  final int? busId;
  final String? description;

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
                    imageUrl: imageUrl!,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 80,
                    height: 22,
                    decoration: BoxDecoration(
                        color: isAvailable!
                            ? appColors.mainColor.withOpacity(0.9)
                            : Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        isAvailable! ? "متاح للحجز" : "غير متاح",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: Appfonts.meduimFont,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: Text(
                title!,
                style: const TextStyle(
                    fontFamily: Appfonts.boldFont,
                    color: appColors.secondColor,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_2_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      Text(
                        "${rdiersCount!} راكب",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.mainFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.bus_alert_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${seatsCount!} مقعد",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.mainFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.speed_outlined,
                        size: 22,
                        color: appColors.secondColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${speed!} كم/س",
                        style: const TextStyle(
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
              onTap: () => Get.toNamed(Routes.TRANSPORT_DETAILS, arguments: {
                "Images": Images,
                "title": title,
                "description": description,
                "seats": seatsCount,
                "speed": speed,
                "riders": rdiersCount,
                "features": features,
                "routes": routes,
                "busId": busId,
              }),
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
