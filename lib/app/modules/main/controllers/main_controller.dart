import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  TextEditingController turn_type = TextEditingController();
  TextEditingController riders_number = TextEditingController();

  // ============
  List<String> Categories = [
    "الكل",
    "ميني باص",
    "باص كبير",
  ];

  List<String> busFeatures = [
    "مكيف",
    "شحن USB",
    "نظام تهوية",
    "دورة مياه",
  ];

  List<String> busProperties = [
    "راكب",
    "مقعد",
    "كيلو متر",
  ];

  var selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
