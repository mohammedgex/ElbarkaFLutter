import 'dart:convert';
import 'package:baraka_trans/app/data/transfersModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:get/get.dart';

class TransfersController extends GetxController {
  final ApiService _apiService = ApiService();
  Future<List> fetchUserTransfers() async {
    List<TranfersModel> transfersList = []; // List of transportation models
    try {
      final response = await _apiService.get('my-routes-reservation');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        transfersList =
            data.map((item) => TranfersModel.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch my reservation data: $e');
    }
    return transfersList.toList();
  }
}
