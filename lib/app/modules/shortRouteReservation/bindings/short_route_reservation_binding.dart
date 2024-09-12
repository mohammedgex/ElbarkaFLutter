import 'package:get/get.dart';

import '../controllers/short_route_reservation_controller.dart';

class ShortRouteReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortRouteReservationController>(
      () => ShortRouteReservationController(),
    );
  }
}
