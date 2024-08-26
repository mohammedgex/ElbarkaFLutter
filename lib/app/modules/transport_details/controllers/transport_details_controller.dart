import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class TransportDetailsController extends GetxController {
  RxInt current = 0.obs;
  RxInt Is_Selected = 0.obs;
  final CarouselController carousel_controller = CarouselController();

  final List<String> imgList = [
    'https://lh6.googleusercontent.com/proxy/wZEV_kzxqLoFZ8bNWCSK1hhdTHG2jHyXAwSAAlnL2wi4Y12eRls7AHZGw63AXALRZQ8y40PKc0vZ3IHNdDh3jgEnvHHP00kqouoSVhJ7ovoIFVvZ',
    'https://manshoor.com/uploads/2019/07/f7d68277ff1ed14dd053861f3435f993.jpg',
    'https://urda-lb.org/wp-content/uploads/2021/01/11.jpg',
    'https://lh6.googleusercontent.com/proxy/wZEV_kzxqLoFZ8bNWCSK1hhdTHG2jHyXAwSAAlnL2wi4Y12eRls7AHZGw63AXALRZQ8y40PKc0vZ3IHNdDh3jgEnvHHP00kqouoSVhJ7ovoIFVvZ',
    'https://manshoor.com/uploads/2019/07/f7d68277ff1ed14dd053861f3435f993.jpg',
    'https://urda-lb.org/wp-content/uploads/2021/01/11.jpg',
  ];

  final List<Map<String, String>> routes = [
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},
    {"routeName": "جدة - المطار - مكة - الفندق", "price": "3000 ر.س"},
    {"routeName": "جدة - المطار - مكة - الفندق", "price": "3000 ر.س"},
    {"routeName": "جدة - المطار - مكة - الفندق", "price": "3000 ر.س"},
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},
    {"routeName": "مكة - المطار - جدة - المطار", "price": "2200 ر.س"},

    // Add more routes here
  ];

  void chng(int index) {
    current.value = index;
  }

  void select_Route(int index) {
    Is_Selected.value = index;
  }
}
