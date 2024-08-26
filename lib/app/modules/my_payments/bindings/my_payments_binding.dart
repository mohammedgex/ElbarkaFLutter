import 'package:get/get.dart';

import '../controllers/my_payments_controller.dart';

class MyPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPaymentsController>(
      () => MyPaymentsController(),
    );
  }
}
