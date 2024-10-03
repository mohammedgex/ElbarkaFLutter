import 'dart:convert';

import 'package:baraka_trans/app/data/bannerModel.dart';
import 'package:baraka_trans/app/data/categoryModel.dart';
import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/app/data/user_model.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  TextEditingController turn_type = TextEditingController();
  TextEditingController riders_number = TextEditingController();
  final ApiService _apiService = ApiService();
  RxBool? isloading = false.obs;
  RxString selectedCategory = 'الكل'.obs;

  List<String> busProperties = [
    "راكب",
    "مقعد",
    "كيلو متر",
  ];

  var selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }

  var userData = UserModel(
    id: 0,
    name: '',
    phone: '',
    email: '',
    isActive: 1,
    isBlocked: 0,
    image: '',
    createdAt: '',
    updatedAt: '',
    profilePhotoUrl: '',
  ).obs;

  // get user data
  void fetchUserData() async {
    try {
      isloading!.value = true;
      final data = await _apiService.getUserData();
      userData.value = UserModel.fromJson(data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data');
    } finally {
      isloading!.value = false;
    }
  }

  Future<List> fetchTransportationData() async {
    List<tranportaionModel> transportationList =
        []; // List of transportation models

    try {
      final response = await _apiService
          .get('buses-with-routes'); // Update with your actual endpoint
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print(data);
        transportationList =
            data.map((item) => tranportaionModel.fromJson(item)).toList();
        print(transportationList);
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return transportationList;
  }

  Future<List> fetchCategories() async {
    List<Category> categoriesList = []; // List of transportation models

    try {
      final response = await _apiService.get('categories');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        categoriesList = data.map((item) => Category.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return categoriesList;
  }

  Future<List> fetchTransportationsById(int id) async {
    List<tranportaionModel> transportationsList = [];

    try {
      final response = await _apiService.get('categories/$id');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        transportationsList =
            data.map((item) => tranportaionModel.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return transportationsList;
  }

  Future<BannerModel> fetchBanners() async {
    final response = await _apiService.get('banner1');
    if (response.statusCode == 200) {
      print(response.body);
      return BannerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load property details');
    }
  }
}
