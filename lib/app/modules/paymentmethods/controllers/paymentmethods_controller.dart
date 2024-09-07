import 'package:baraka_trans/utilits/auth.dart';
import 'package:baraka_trans/utilits/paymob_manager.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentmethodsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String? paymentKey;
  final Timecontroller = BoardDateTimeTextController();
  RxBool isLoading = false.obs;
  final AuthRepository _authRepository = AuthRepository();

  // api fields
  double? amountEGP;
  double? amountSR;
  int? reservationId;

  // animation
  late AnimationController animationController;
  late Animation<double> animation;
  var isAnimating = false.obs;

  void startAnimation() {
    isAnimating.value = true;
    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    print(paymentKey);
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    // Start the animation
    startAnimation();
  }

  final List<Map<String, dynamic>> paymentMedthods = [
    {"name": "الدفع بالكارت", "icon": "assets/payments.svg"},
    {"name": "الدفع بمقر الشركة", "icon": "assets/history.svg"},
    {"name": "طلب مندوب لاستيلام الدفع", "icon": "assets/bus.svg"},
  ];

  Future<void> pay() async {
    PaymobManager()
        .getPaymentKey(amountEGP! * 13.5, "EGP")
        .then((String value) {
      paymentKey = value;
    });
  }

  void payWithCard() async {
    try {
      final result = await _authRepository.payWithCard(
          reservationId! ?? 1, amountEGP! * 13.5);
      if (result["success"]) {
        print("success");
      } else {}
    } catch (e) {
      print("erro $e");
    }
  }
}
