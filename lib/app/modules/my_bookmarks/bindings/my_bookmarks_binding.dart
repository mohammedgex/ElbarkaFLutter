import 'package:get/get.dart';

import '../controllers/my_bookmarks_controller.dart';

class MyBookmarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBookmarksController>(
      () => MyBookmarksController(),
    );
  }
}
