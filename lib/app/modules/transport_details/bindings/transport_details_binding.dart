import 'package:get/get.dart';

import '../controllers/transport_details_controller.dart';

class TransportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransportDetailsController>(
      () => TransportDetailsController(),
    );
  }
}
