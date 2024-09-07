import 'package:baraka_trans/app/modules/myreservations/controllers/myreservations_controller.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ReservationDetails extends StatelessWidget {
  ReservationDetails(
      {super.key,
      this.imageUrl,
      this.routeName,
      this.routePrice,
      this.busTitle,
      // this.arrivalDate,
      // this.arrivalPoint,
      this.busRiders,
      this.date,
      // this.deptureDate,
      // this.depturePoint,
      this.paymentMethod,
      this.id,
      this.status});

  String? imageUrl;
  String? date;
  String? routeName;
  int? id;
  String? routePrice;
  String? status;
  String? paymentMethod;
  String? busTitle;
  String? arrivalPoint;
  String? arrivalDate;
  String? depturePoint;
  String? deptureDate;
  String? busRiders;

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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://192.168.1.80:8000/uploads/${imageUrl}"))),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "#$id",
                    style: const TextStyle(
                        color: appColors.mainColor,
                        fontSize: 14,
                        fontFamily: Appfonts.meduimFont),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyLight.calendar,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Center(
                        child: Text(
                          date!,
                          style: const TextStyle(
                              fontSize: 11,
                              color: appColors.textColor,
                              fontFamily: Appfonts.meduimFont),
                        ),
                      )
                    ],
                  ),
                  Text(
                    routeName!,
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: Appfonts.meduimFont,
                        color: appColors.textColor),
                  ),
                  Row(
                    children: [
                      const Icon(IconlyLight.wallet,
                          size: 16, color: appColors.textColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        routePrice!,
                        style: const TextStyle(
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
