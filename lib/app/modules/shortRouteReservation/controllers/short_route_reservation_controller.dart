import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';

class ShortRouteReservationController extends GetxController {
  var selectedValue = transRoutes().obs;

  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  final AuthRepository _authRepository = AuthRepository();
  final Timecontroller = BoardDateTimeTextController();
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;

  int? reservationId;

  final timecontroller = BoardDateTimeTextController();
  final RxInt price = 0.obs;

  var transList = <transRoutes>[].obs;
  var selectedRoutes = <transRoutes>[].obs;
  RxInt routeIndex = 0.obs;
  var newSelectedRoutes = [];

  int? busId;
  int? routeId;
  String? AirLinesName,
      TripNumber,
      orign,
      destination,
      numberOfRiders,
      numberOfBags;
  DateTime? SelectedDate = DateTime.now();
  DateTime? SelectedTime = DateTime.now();

  // List of routes for the dropdown
  List<transRoutes> availableRoutes = [];

  void addTransaction(transRoutes route) {
    transList.add(route);
  }

  void setSelected(transRoutes value) {
    selectedValue.value = value;
  }

  void addPrice(int currentPrice) {
    price.value += currentPrice;
  }

  Future<void> reservation(BuildContext context) async {
    isLoading.value = true; // Show loading indicator

    try {
      // Call the smallReservation method from the repository and pass required parameters

      final result = await _authRepository.smallReservation(
          busId!,
          newSelectedRoutes[routeIndex.value].id,
          int.parse(numberOfRiders!),
          int.parse(numberOfBags!),
          TripNumber!,
          AirLinesName!,
          SelectedTime.toString(),
          SelectedDate.toString(),
          orign!,
          destination!,
          context);

      // Handle success response
      if (result["success"]) {
        isLoading.value = false;
        IconSnackBar.show(context,
            snackBarType: SnackBarType.success,
            labelTextStyle: const TextStyle(fontSize: 12),
            label: 'تمت عملية الحجز بنجاح');
      } else {
        isLoading.value = false;
        IconSnackBar.show(context,
            snackBarType: SnackBarType.fail,
            labelTextStyle: const TextStyle(fontSize: 12),
            label: 'فشلت عملية الحجز');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      isLoading.value = false;
      IconSnackBar.show(context,
          snackBarType: SnackBarType.fail,
          labelTextStyle: const TextStyle(fontSize: 12),
          label: 'حدث خطأ اثناء الحجز');
    }
  }
}
