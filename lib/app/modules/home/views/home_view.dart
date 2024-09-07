import 'package:baraka_trans/utilits/bottom_navigationBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.Pages[controller.currentPage.value],
          bottomNavigationBar: bottom_NavigationBar(controller: controller),
        ));
  }
}
