// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TransportDetailsController extends GetxController {
  RxInt current = 0.obs;
  RxInt Is_Selected = 0.obs;
  RxInt selectedRouteTyp = 0.obs;
  final CarouselController carousel_controller = CarouselController();
  final AuthRepository _authRepository = AuthRepository();
  final ApiService _apiService = ApiService();

  transRoutes? selectedRoute;

  final List<String> routeCategory = ["الدورات", "الوصلات"];

  final List<String> imgList = [
    'https://lh6.googleusercontent.com/proxy/wZEV_kzxqLoFZ8bNWCSK1hhdTHG2jHyXAwSAAlnL2wi4Y12eRls7AHZGw63AXALRZQ8y40PKc0vZ3IHNdDh3jgEnvHHP00kqouoSVhJ7ovoIFVvZ',
    'https://manshoor.com/uploads/2019/07/f7d68277ff1ed14dd053861f3435f993.jpg',
    'https://urda-lb.org/wp-content/uploads/2021/01/11.jpg',
    'https://lh6.googleusercontent.com/proxy/wZEV_kzxqLoFZ8bNWCSK1hhdTHG2jHyXAwSAAlnL2wi4Y12eRls7AHZGw63AXALRZQ8y40PKc0vZ3IHNdDh3jgEnvHHP00kqouoSVhJ7ovoIFVvZ',
    'https://manshoor.com/uploads/2019/07/f7d68277ff1ed14dd053861f3435f993.jpg',
    'https://urda-lb.org/wp-content/uploads/2021/01/11.jpg',
  ];

  List<transRoutes> routes = [];

  void chng(int index) {
    current.value = index;
  }

  void select_Route(int index) {
    Is_Selected.value = index;
  }

  void InitalRoute() {
    selectedRoute = routes[0];
  }

  void addToFavorite(int busId, BuildContext context) async {
    try {
      final response = await _authRepository.addBusToFavorite(busId, context);

      print('Bus added to favorite: $response');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<tranportaionModel?> fetchBusData(int busId) async {
    try {
      final response = await _apiService.get('buses/$busId');

      if (response.statusCode == 200) {
        // Parse the bus data
        final busData = tranportaionModel.fromJson(jsonDecode(response.body));
        print('Bus data: ${busData.description}');
        return busData; // Return the Bus object
      } else {
        throw Exception('Failed to get data: ${response.body}');
      }
    } catch (e) {
      throw Exception(
          'Failed to get data: $e'); // Return null in case of an exception
    }
  }
}
