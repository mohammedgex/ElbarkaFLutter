import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusUnit extends StatelessWidget {
  const BusUnit({
    super.key,
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
    this.busId,
    this.CompanyName,
  });

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
  final String? CompanyName;

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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(loadingBuilder: (BuildContext context,
                        Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image is fully loaded
                      } else {
                        // Display a loading indicator
                        return Center(
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                                color: appColors.textColor,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      }
                    }, fit: BoxFit.cover, imageUrl!),
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
                            ? appColors.mainColor.withOpacity(0.8)
                            : Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        isAvailable! ? "متاح للحجز" : "غير متاح",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: Appfonts.lightFont,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    width: 200,
                    height: 22,
                    decoration: BoxDecoration(
                        color: appColors.secondColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        CompanyName!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: Appfonts.lightFont,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                        fontFamily: Appfonts.boldFont,
                        color: appColors.secondColor,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      description!,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: Appfonts.lightFont,
                          color: appColors.textColor,
                          fontSize: 10),
                    ),
                  ),
                ],
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
                        size: 18,
                        color: appColors.secondColor,
                      ),
                      Text(
                        "${rdiersCount!} راكب",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.lightFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.bus_alert_outlined,
                        size: 18,
                        color: appColors.secondColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${seatsCount!} مقعد",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.lightFont,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.speed_outlined,
                        size: 18,
                        color: appColors.secondColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${speed!} كم/س",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.lightFont,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: appColors.secondColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${routes!.length} مسارات",
                        style: const TextStyle(
                            color: appColors.mainColor,
                            fontFamily: Appfonts.lightFont,
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
                "Description": description,
                "companyName": CompanyName,
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
