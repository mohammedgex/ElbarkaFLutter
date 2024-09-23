import 'dart:convert';

import 'package:baraka_trans/app/data/favoriteModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:baraka_trans/utilits/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SavedTransportationsController extends GetxController {
  final ApiService _apiService = ApiService();
  final AuthRepository _authRepository = AuthRepository();

  Future<List> fetchUserFavoritesList() async {
    List<Favoritemodel> favoritesList = []; // List of transportation models

    try {
      final response = await _apiService.get('favorites');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        favoritesList =
            data.map((item) => Favoritemodel.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return favoritesList.reversed.toList();
  }

  void removeFromFavorite(int busId, BuildContext context) async {
    try {
      final response =
          await _authRepository.removeBusFromFavorite(busId, context);

      print('Bus added to favorite: $response');
    } catch (e) {
      print('Error: $e');
    }
  }
}
