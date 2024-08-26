import 'package:get/get.dart';

import '../controllers/paymentmethods_controller.dart';

class PaymentmethodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentmethodsController>(
      () => PaymentmethodsController(),
    );
  }
}
