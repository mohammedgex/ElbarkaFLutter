import 'package:get/get.dart';

import '../controllers/my_profile_detials_controller.dart';

class MyProfileDetialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProfileDetialsController>(
      () => MyProfileDetialsController(),
    );
  }
}
