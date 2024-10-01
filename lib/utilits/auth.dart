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
    int busId,
    int busRouteId,
    int numPilgrims,
    int numBags,
    String umrahCompany,
    String meccaHotelName,
    String medinaHotelName,
  ) async {
    final data = {
      'bus_id': busId,
      'bus_route_id': busRouteId,
      'num_pilgrims': numPilgrims,
      'num_bags': numBags,
      'umrah_company': umrahCompany,
      'mecca_hotel_name': meccaHotelName,
      'medina_hotel_name': medinaHotelName,
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
      int busId,
      int busRouteId,
      int numberOfRiders,
      int numberOfBags,
      String tripNumber,
      String travelAirlines,
      String time,
      String date,
      String origin,
      String destination,
      BuildContext context) async {
    final data = {
      'bus_id': busId,
      'route_id': busRouteId,
      'trip_number': tripNumber,
      'number_of_bags': numberOfBags,
      'origin': origin,
      'destination': destination,
      'number_of_riders': numberOfRiders,
      'date': date,
      'time': time,
      'travel_airlines': travelAirlines,
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
    int reservationId,
    String date,
    String time,
    String flightNumber,
    String airline,
    String type,
  ) async {
    final data = {
      'reservation_id': reservationId,
      'date': date,
      'time': time,
      'flight_number': flightNumber,
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
    int reservationId,
    DateTime movementDate,
    String fromPlace,
    String toPlace,
    String movementTime,
    String busArrivalTime,
  ) async {
    final data = {
      'reservation_id': reservationId,
      'movement_date': movementDate,
      'from_place': fromPlace,
      'to_place': toPlace,
      'movement_time': movementTime,
      'bus_arrival_time': busArrivalTime,
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
    int reservationId,
    String visitDate,
    String fromPlace,
    String toPlace,
    String movementTime,
    String busArrivalTime,
  ) async {
    final data = {
      'reservation_id': reservationId,
      'visit_date': visitDate,
      'from_place': fromPlace,
      'to_place': toPlace,
      'movement_time': movementTime,
      'bus_arrival_time': busArrivalTime,
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

  // Method to cancel reservation
  Future<Map<String, dynamic>> cancelReservation(
      int reservationId, BuildContext context) async {
    final response =
        await _apiService.post('/reservations/$reservationId/cancel', {});

    if (response.statusCode == 200) {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.success,
          labelTextStyle: const TextStyle(fontSize: 12),
          label: 'تم الغاء الحجز بنجاح');
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      IconSnackBar.show(context,
          snackBarType: SnackBarType.fail,
          label:
              'لا يمكنك الغاء الحجز قبل 48 ساعة من بداية الوصول , تواصل مع الدعم.',
          labelTextStyle: const TextStyle(fontSize: 12));
      throw Exception('can\'t cancel');
    } else {
      throw Exception('Failed to cancel reservation: ${response.body}');
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

  Future<Map<String, dynamic>> payForTransfers(
      BuildContext context, double amount) async {
    final response = await _apiService.post('pay', {"amount": amount});

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        IconSnackBar.show(context,
            snackBarType: SnackBarType.success,
            labelTextStyle: const TextStyle(fontSize: 12),
            label: 'تم الدفع بنجاح!');
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
