import 'dart:convert';

import 'package:baraka_trans/app/data/paymentModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyPaymentsController extends GetxController {
  final ApiService _apiService = ApiService();

  final storage = GetStorage();

  Future<List> fetchUserPayments() async {
    List<paymentModel> paymentsList = []; // List of transportation models

    try {
      final response = await _apiService.get('user/payments');
      print(storage.read("token"));
      print(response.body); // Update with your actual endpoint
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["payments"];
        print(data);
        paymentsList = data.map((item) => paymentModel.fromJson(item)).toList();
        print(paymentsList);
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return paymentsList;
  }

  String extractDate(String dateTimeString) {
    // Parse the DateTime string
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the DateTime to only include the date (YYYY-MM-DD)
    String formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    return formattedDate;
  }

  @override
  void onInit() async {
    await fetchUserPayments();
    super.onInit();
  }
}
