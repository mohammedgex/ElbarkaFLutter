import 'dart:convert';
import 'dart:io';
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
    int num_buses,
    String umrah_company,
    String mecca_hotel_name,
    String medina_hotel_name,
  ) async {
    final data = {
      'bus_id': bus_id,
      'bus_route_id': bus_route_id,
      'num_pilgrims': num_pilgrims,
      'num_buses': num_buses,
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

  // storeArrivalDeparture
  Future<Map<String, dynamic>> storeArrivalDeparture(
    int reservation_id,
    DateTime date,
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
    DateTime visit_date,
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
    required String birthdate,
    required String passportNumber,
    required String password,
    required String country,
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
    request.fields['birthdate'] = birthdate;
    request.fields['passport_number'] = passportNumber;
    request.fields['password'] = password;
    request.fields['country'] = country;

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
}
