import 'package:get/get.dart';

import '../controllers/saved_transportations_controller.dart';

class SavedTransportationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedTransportationsController>(
      () => SavedTransportationsController(),
    );
  }
}
