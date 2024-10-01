import 'package:baraka_trans/app/modules/myreservations/controllers/myreservations_controller.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
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
      this.arrivalDate,
      this.arrivalPoint,
      this.busRiders,
      this.date,
      this.deptureDate,
      this.depturePoint,
      this.id,
      this.numOfriders,
      this.paymentMethod,
      this.paymentStatus,
      this.priceiEGP,
      this.reservationStatus,
      this.status,
      this.transportationId,
      this.contactBooking,
      this.transportationImages,
      this.reservationId});

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
  String? reservationStatus;
  String? paymentStatus;
  String? priceiEGP;
  String? numOfriders;
  int? transportationId;
  bool? contactBooking;
  List? transportationImages;
  int? reservationId;

  @override
  Widget build(BuildContext context) {
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
                                "https://6874-188-40-217-164.ngrok-free.app/storage/$imageUrl"))),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(151, 30, 176, 127),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          routeName!,
                          style: const TextStyle(
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
                    "#654321$id",
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
                  const Row(
                    children: [
                      Icon(IconlyLight.location,
                          size: 16, color: appColors.textColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "اسم المسار",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: Appfonts.meduimFont,
                            color: appColors.textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(IconlyLight.wallet,
                          size: 16, color: appColors.textColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${routePrice!} ريال",
                        style: const TextStyle(
                            fontSize: 10,
                            fontFamily: Appfonts.meduimFont,
                            color: appColors.textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(IconlyLight.wallet,
                          size: 16, color: appColors.textColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${int.parse(routePrice!) * 13} جنية",
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
              onTap: () =>
                  Get.toNamed(Routes.MY_RESERVATION_DETAILS, arguments: {
                    "reservationStatus": reservationStatus,
                    "paymentStatus": paymentStatus,
                    "paymentMethod": paymentMethod!,
                    "priceiSAR": routePrice!,
                    "routeType": routeName!,
                    "arrivalDate": arrivalDate!,
                    "arrivalPoint": arrivalPoint!,
                    "deptureDate": deptureDate!,
                    "depturePonit": depturePoint!,
                    "numOfriders": busRiders!,
                    "transType": busTitle!,
                    "transportationId": transportationId!,
                    "date": date!,
                    "busId": id,
                    "Images": transportationImages,
                    "reservationId": reservationId,
                    "bookingContact": contactBooking
                  }),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 26,
              ))
        ],
      ),
    );
  }
}
