import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:baraka_trans/utilits/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  // login

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final data = {'phone': phone, 'password': password};
    final response = await _apiService.post('login', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // forget password

  Future<Map<String, dynamic>> forgetPassword(
    String phone,
  ) async {
    final data = {
      'phone': phone,
    };
    final response = await _apiService.post('forgot-password', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // reservation
  Future<Map<String, dynamic>> reservation(
    int bus_id,
    int bus_route_id,
    int num_pilgrims,
    int num_bags,
    String umrah_company,
    String mecca_hotel_name,
    String medina_hotel_name,
  ) async {
    final data = {
      'bus_id': bus_id,
      'bus_route_id': bus_route_id,
      'num_pilgrims': num_pilgrims,
      'num_bags': num_bags,
      'umrah_company': umrah_company,
      'mecca_hotel_name': mecca_hotel_name,
      'medina_hotel_name': medina_hotel_name,
    };
    final response = await _apiService.post('user/reservations', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // reservation
  Future<Map<String, dynamic>> smallReservation(
      int bus_id,
      int bus_route_id,
      int number_of_riders,
      int number_of_bags,
      String trip_number,
      String travel_airlines,
      String time,
      String date,
      String origin,
      String destination,
      BuildContext context) async {
    final data = {
      'bus_id': bus_id,
      'route_id': bus_route_id,
      'trip_number': trip_number,
      'number_of_bags': number_of_bags,
      'origin': origin,
      'destination': destination,
      'number_of_riders': number_of_riders,
      'date': date,
      'time': time,
      'travel_airlines': travel_airlines,
    };
    final response = await _apiService.post('small-routes-reservation', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // storeArrivalDeparture
  Future<Map<String, dynamic>> storeArrivalDeparture(
    int reservation_id,
    String date,
    String time,
    String flight_number,
    String airline,
    String type,
  ) async {
    final data = {
      'reservation_id': reservation_id,
      'date': date,
      'time': time,
      'flight_number': flight_number,
      'airline': airline,
      'type': type,
    };
    final response = await _apiService.post('arrival-departures', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // storeInternalMovement
  Future<Map<String, dynamic>> storeInternalMovement(
    int reservation_id,
    DateTime movement_date,
    String from_place,
    String to_place,
    String movement_time,
    String bus_arrival_time,
  ) async {
    final data = {
      'reservation_id': reservation_id,
      'movement_date': movement_date,
      'from_place': from_place,
      'to_place': to_place,
      'movement_time': movement_time,
      'bus_arrival_time': bus_arrival_time,
    };
    final response = await _apiService.post('internal-movements', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // storeVisit
  Future<Map<String, dynamic>> storeVisit(
    int reservation_id,
    String visit_date,
    String from_place,
    String to_place,
    String movement_time,
    String bus_arrival_time,
  ) async {
    final data = {
      'reservation_id': reservation_id,
      'visit_date': visit_date,
      'from_place': from_place,
      'to_place': to_place,
      'movement_time': movement_time,
      'bus_arrival_time': bus_arrival_time,
    };
    final response = await _apiService.post('visits', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // register

  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required File image,
  }) async {
    final url = Uri.parse('${_apiService.baseUrl}register');
    final request = http.MultipartRequest('POST', url);

    // Adding headers
    request.headers.addAll(_apiService.getHeaders());

    // Adding fields
    request.fields['name'] = name;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['password'] = password;

    // Adding image file
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }

  // verify otp
  Future<Map<String, dynamic>> verifyOTP(
    String phone,
    String otpCode,
  ) async {
    final data = {
      'phone': phone,
      'otp_code': otpCode,
    };
    final response = await _apiService.post('verify-otp', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // chnage user data
  Future<Map<String, dynamic>> updateProfile(
      String name, String phone, String email) async {
    final data = {'name': name, 'phone': phone, 'email': email};
    final response = await _apiService.post('update-profile', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // add payment
  Future<Map<String, dynamic>> payWithCard(
      int reservationId, double amount) async {
    final data = {'reservation_id': reservationId, 'amount': amount};
    final response = await _apiService.post('user/payments', data);

    if (response.statusCode == 200) {
      // Decode and handle the response as needed
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // Method to add bus to favorite
  Future<Map<String, dynamic>> addBusToFavorite(
      int busId, BuildContext context) async {
    final response = await _apiService.post('bus/$busId/favorite', {});

    if (response.statusCode == 200) {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.success,
          labelTextStyle: const TextStyle(fontSize: 12),
          label: 'تم الاضافة الي المفضلة بنجاح');
      return jsonDecode(response.body);
    } else {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.fail,
          label: 'تمت اضافة هذا العنصر مسبقا.',
          labelTextStyle: const TextStyle(fontSize: 12));
      throw Exception('Failed to add bus to favorites: ${response.body}');
    }
  }

  // Method to add bus to favorite
  Future<Map<String, dynamic>> removeBusFromFavorite(
      int busId, BuildContext context) async {
    final response = await _apiService.post('delete/$busId/favorite', {});

    if (response.statusCode == 200) {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.success,
          labelTextStyle: const TextStyle(fontSize: 12),
          label: 'تم الازالة من المفضلة بنجاح');
      return jsonDecode(response.body);
    } else {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.fail,
          label: 'تمت اضافة هذا العنصر مسبقا.',
          labelTextStyle: const TextStyle(fontSize: 12));
      throw Exception('Failed to add bus to favorites: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> payInCompany(BuildContext context) async {
    final response = await _apiService.post('company-hq-payment-requests', {});

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        IconSnackBar.show(context,
            snackBarType: SnackBarType.success,
            labelTextStyle: const TextStyle(fontSize: 12),
            label: 'تم ارسال الطلب');
        return jsonDecode(response.body);
      } else {
        IconSnackBar.show(context,
            snackBarType: SnackBarType.fail,
            label: 'حدث خطأ.',
            labelTextStyle: const TextStyle(fontSize: 12));
        throw Exception('Failed to add bus to favorites: ${response.body}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add bus to favorites: ${response.body}');
    }
  }
}
