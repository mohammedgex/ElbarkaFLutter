import 'package:baraka_trans/app/modules/reservation/views/ArrivalReservationView.dart';
import 'package:baraka_trans/app/modules/reservation/views/DeptureReservationView.dart';
import 'package:baraka_trans/app/modules/reservation/views/MaddinaVisitsReservationView.dart';
import 'package:baraka_trans/app/modules/reservation/views/MeccaVisitsReservationView.dart';
import 'package:baraka_trans/app/modules/reservation/views/BasicReservationView.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColors.mainColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "حجز وسيلة النقل",
          style: TextStyle(
            color: Colors.white,
            fontFamily: Appfonts.mainFont,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            color: Colors.white,
            Icons.cancel,
            size: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() => LinearProgressIndicator(
                color: appColors.secondColor,
                value: (controller.currentPage.value + 1) /
                    5, // Dividing by the number of pages
              )),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                controller.currentPage.value = page;
              },
              children: const [
                BasicReservationView(),
                ArrivalReservationView(),
                DeptureReservationView(),
                MeccaVisitsReservationView(),
                MaddinaVisitsReservationView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
