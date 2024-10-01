import 'dart:convert';

import 'package:baraka_trans/app/data/reservationModel.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyreservationsController extends GetxController {
  final ApiService _apiService = ApiService();
  final AuthRepository _authRepository = AuthRepository();

  Future<List> fetchUserReservations() async {
    List<reservationModel> reservationsList =
        []; // List of transportation models

    try {
      final response = await _apiService.get('user/reservations');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["reservations"];
        print(data);
        reservationsList =
            data.map((item) => reservationModel.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return reservationsList.reversed.toList();
  }

  // show dialog
  void viewMore(
      {BuildContext? context,
      String? reservationStatus,
      String? paymentStatus,
      String? paymentMethod,
      String? priceiSAR,
      String? routeType,
      String? arrivalDate,
      String? arrivalPoint,
      String? deptureDate,
      String? depturePonit,
      String? numOfriders,
      String? transType,
      int? transportationId,
      String? date,
      bool? bookingContact,
      int? busId,
      List? Images,
      int? reservationId}) {
    Get.bottomSheet(
      LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    IconlyLight.info_square,
                    size: 50,
                    color: appColors.mainColor,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 0.28,
                    ),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: appColors.borderColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        buildRow("حالة الحجز :", paymentStatus),
                        const SizedBox(height: 5),
                        buildRow("تاريخ الحجز :", date),
                        const SizedBox(height: 5),
                        buildRow("طريقة الدفع :", paymentMethod),
                        const SizedBox(height: 5),
                        buildRow("المبلغ الاجمالي :", "${priceiSAR!} ريال"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 0.45,
                    ),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: appColors.borderColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        buildRow("نوع وسيلة النقل :", transType),
                        const SizedBox(height: 5),
                        buildRow("مسار النقل :", routeType),
                        const SizedBox(height: 5),
                        buildRow("تاريخ الوصول :", arrivalDate),
                        const SizedBox(height: 5),
                        buildRow("نقطة الوصول :", arrivalPoint),
                        const SizedBox(height: 5),
                        buildRow("نقطة المغادرة :", depturePonit),
                        const SizedBox(height: 5),
                        buildRow("تاريخ المغادرة :", deptureDate),
                        const SizedBox(height: 5),
                        buildRow("عدد الركاب :", numOfriders),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => bookingContact
                              ? print("ddd")
                              : showCancel(reservationId!, context),
                          child: Button(
                            title: bookingContact!
                                ? "بيانات التواصل"
                                : "الغاء الحجز",
                            Btncolor: appColors.mainColor,
                            raduis: 8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              Get.toNamed(Routes.TRANSPORT_DETAILS, arguments: {
                            "Images": Images,
                            "busId": busId,
                          }),
                          child: const Button(
                            title: "عرض الوسيلة",
                            Btncolor: appColors.secondColor,
                            raduis: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showCancel(int reservationId, BuildContext context) {
    Get.defaultDialog(
      title: "هل انت متأكد من الغاء الحجز ؟",
      titleStyle:
          const TextStyle(fontSize: 14, fontFamily: Appfonts.meduimFont),
      middleText:
          "في حالة الغاء الحجز سيقوم الفريق المختص بالتواصل معاك لارجاع المبلغ المدفوع",
      middleTextStyle:
          const TextStyle(fontSize: 10, fontFamily: Appfonts.lightFont),
      textConfirm: "تأكيد",
      textCancel: "تراجع",
      radius: 12,
      onConfirm: () {
        cancelReservation(reservationId, context);
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  Widget buildRow(String label, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontFamily: Appfonts.lightFont),
        ),
        Text(
          value!,
          style: const TextStyle(
              fontFamily: Appfonts.meduimFont,
              fontSize: 10,
              color: appColors.mainColor),
        ),
      ],
    );
  }

  void cancelReservation(int reservationId, BuildContext context) async {
    try {
      final response =
          await _authRepository.cancelReservation(reservationId, context);

      print('Bus added to favorite: $response');
    } catch (e) {
      print('Error: $e');
    }
  }
}
