import 'dart:convert';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  final AuthRepository _authRepository = AuthRepository();
  final Timecontroller = BoardDateTimeTextController();
  RxBool isLoading = false.obs;
  int? reservationId;

  int? busId;
  int? routeId;
  double? amountSR;

  // Main resrevation
  String? basicMaccaHotelName = "";
  String? basicMaddinaName = "";
  String? basicRidersCount = "";
  String? basicBagsCount = "";

  // aarival inputs
  String? arrivalAirLinesName = "";
  String? arrivalAirLinesNumber = "";
  DateTime? selectedDate = DateTime.now();
  DateTime? selectedTime = DateTime.now();

  // depture page
  String? DeptureAirLinesName = "";
  String? DeptureAirLinesNumber = "";
  DateTime? deptureSelectedDate = DateTime.now();
  DateTime? deptureSelectedTime = DateTime.now();

  // MeccaVisits page
  String? MeccaFrom = "";
  String? MeccaTo = "";
  DateTime? meccaVisitSelectedDate = DateTime.now();
  DateTime? meccaVisitSelectedTime = DateTime.now();

  // MaddinaVisits page
  String? maddinaFrom = "";
  String? maddinaTo = "";
  DateTime? maddinaVisitSelectedDate = DateTime.now();
  DateTime? maddinaVisitSelectedTime = DateTime.now();

  // cancel reservation
  void cancel() {
    Get.bottomSheet(
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: const Text("ddd"),
        ),
        backgroundColor: Colors.white,
        enterBottomSheetDuration: const Duration(milliseconds: 200),
        elevation: 1);
  }

  // call main reservation api
  void reservation() async {
    isLoading.value = true;
    try {
      final result = await _authRepository.reservation(
        busId!,
        routeId!,
        int.parse(basicRidersCount!),
        int.parse(basicBagsCount!),
        "البركة",
        basicMaccaHotelName!,
        basicMaddinaName!,
      );
      // success
      if (result["success"]) {
        isLoading.value = false;
        reservationId = jsonDecode(result["reservation"]["id"]);
        print("IDD $reservationId");
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.slowMiddle,
        );
      } else {
        print("failed");
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  // call arivalDepture
  void arivalDepture(bool isArrival) async {
    isLoading.value = true;

    try {
      final result = await _authRepository.storeArrivalDeparture(
          reservationId!,
          isArrival ? selectedDate! : deptureSelectedDate!,
          isArrival ? selectedTime.toString() : deptureSelectedTime.toString(),
          isArrival ? arrivalAirLinesNumber! : DeptureAirLinesNumber!,
          isArrival ? arrivalAirLinesName! : DeptureAirLinesName!,
          isArrival ? "وصول" : "مغادرة");
      // success
      if (result["success"]) {
        isLoading.value = false;
        print('doneeeeeeeeeeeee');
      } else {
        print("failed");
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  // call visits
  void visits(bool isMecca) async {
    isLoading.value = true;

    try {
      final result = await _authRepository.storeVisit(
        reservationId!,
        isMecca ? meccaVisitSelectedDate! : maddinaVisitSelectedDate!,
        isMecca ? MeccaFrom.toString() : maddinaFrom.toString(),
        isMecca ? MeccaFrom.toString() : maddinaTo.toString(),
        isMecca
            ? meccaVisitSelectedTime.toString()
            : maddinaVisitSelectedTime.toString(),
        isMecca
            ? meccaVisitSelectedTime.toString()
            : maddinaVisitSelectedTime.toString(),
      );
      // success
      if (result["success"]) {
        isLoading.value = false;
      } else {
        print("failed");
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
