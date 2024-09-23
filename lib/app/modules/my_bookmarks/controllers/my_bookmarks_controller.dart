import 'dart:convert';

import 'package:baraka_trans/app/data/favoriteModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:get/get.dart';

class MyBookmarksController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<List> fetchUserFavoritesList() async {
    List<Favoritemodel> favoritesList = []; // List of transportation models

    try {
      final response = await _apiService.get('favorites');
      print(response.body); // Update with your actual endpoint
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print(data);
        favoritesList =
            data.map((item) => Favoritemodel.fromJson(item)).toList();
        print(favoritesList);
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return favoritesList.reversed.toList();
  }
}
