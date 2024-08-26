import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  final Timecontroller = BoardDateTimeTextController();

  // cancel reservation
  void cancel() {
    Get.bottomSheet(
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Text("ddd"),
        ),
        backgroundColor: Colors.white,
        enterBottomSheetDuration: const Duration(milliseconds: 200),
        elevation: 1);
  }
}
