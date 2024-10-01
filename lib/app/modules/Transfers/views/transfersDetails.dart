import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../controllers/transfers_controller.dart';

class TransferDetailsView extends GetView<TransfersController> {
  TransferDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the passed arguments
    final arguments = Get.arguments;

    // Accessing the individual variables
    final tripNumber = arguments['tripNumber'];
    final Images = arguments['Images'];
    final busId = arguments['busId'];
    final numberOfRiders = arguments['numberOfRiders'];
    final travelAirlines = arguments['travelAirlines'];
    final time = arguments['time'];
    final date = arguments['date'];
    final origin = arguments['origin'];
    final destination = arguments['destination'];
    final reservationStatus = arguments['reservationStatus'];
    final type = arguments['type'];
    final routeName = arguments['routeName'];
    final price = arguments['price'];
    final createdAt = arguments['createdAt'];
    final imageUrl = arguments['imageUrl'];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              color: appColors.secondColor,
              Icons.arrow_back_ios,
              size: 25,
            ),
          ),
          centerTitle: true,
          title: const Text('تفاصيل الحجز'),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        fit: BoxFit.cover,
                        "https://6874-188-40-217-164.ngrok-free.app/storage/$imageUrl"),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 80,
                    height: 22,
                    decoration: BoxDecoration(
                        color: appColors.mainColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        reservationStatus,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: Appfonts.lightFont,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: appColors.borderColor),
                      borderRadius: BorderRadius.circular(6)),
                  child: GestureDetector(
                    onTap: () =>
                        Get.toNamed(Routes.TRANSPORT_DETAILS, arguments: {
                      "Images": Images,
                      "busId": busId,
                    }),
                    child: const Center(
                        child: Text(
                      "عرض وسيلة النقل",
                      style: TextStyle(color: appColors.textColor),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                        fontFamily: Appfonts.boldFont,
                        color: appColors.secondColor,
                        fontSize: 18),
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                        fontFamily: Appfonts.boldFont,
                        color: appColors.textColor,
                        fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                      color: appColors.mainColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      "$origin - $destination",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: Appfonts.lightFont,
                          color: Colors.white,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      border: Border.all(color: appColors.borderColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rowDetail(
                        title: "تاريخ الحجز",
                        detail: DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(createdAt.toString())),
                      ),
                      rowDetail(
                        title: "الخطوط الجوية",
                        detail: travelAirlines,
                      ),
                      rowDetail(
                        title: "عدد الركاب",
                        detail: numberOfRiders.toString(),
                      ),
                      rowDetail(
                        title: "رقم الرحلة",
                        detail: tripNumber,
                      ),
                      rowDetail(
                        title: "توقيت الوصول",
                        detail: DateFormat('HH:mm')
                            .format(DateTime.parse(time.toString())),
                      ),
                      rowDetail(
                        title: "تاريخ الوصول",
                        detail: DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(date.toString())),
                      ),
                      rowDetail(
                        title: "اسم المسار",
                        detail: routeName,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class rowDetail extends StatelessWidget {
  rowDetail({super.key, this.detail, this.title});
  String? title;
  String? detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!),
        Text(
          detail!,
          style: const TextStyle(fontFamily: Appfonts.lightFont),
        )
      ],
    );
  }
}
