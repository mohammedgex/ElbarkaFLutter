import 'package:get/get.dart';

import '../controllers/myreservations_controller.dart';

class MyreservationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyreservationsController>(
      () => MyreservationsController(),
    );
  }
}
