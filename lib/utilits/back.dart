import 'package:flutter/material.dart';
import 'package:get/get.dart';

class backIcon extends StatelessWidget {
  const backIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: const Icon(
        color: Colors.white,
        Icons.arrow_back_ios,
        size: 25,
      ),
    );
  }
}
