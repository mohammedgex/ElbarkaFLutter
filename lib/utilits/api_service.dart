import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.1.80:8000/api/';
  final storage = GetStorage();

  // Method to get the headers for all requests
  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${storage.read("token")}', // Replace with your token if needed
      // Add other headers as necessary
    };
  }

  // Generic POST request method
  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse(baseUrl + endpoint);
    final headers = getHeaders();
    final body = jsonEncode(data);

    try {
      final response = await http.post(url, headers: headers, body: body);
      return response;
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }

  // Generic GET request method
  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);
    final headers = getHeaders();

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    }
  }

  // Method to get user data with Bearer token
  Future<Map<String, dynamic>> getUserData() async {
    final storage = GetStorage();
    final token = storage.read('token'); // Retrieve token from GetStorage

    if (token == null) {
      throw Exception('Token not found');
    }

    final url = Uri.parse('${baseUrl}user');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body)["user"];
    } else {
      throw Exception('Failed to load user data: ${response.statusCode}');
    }
  }
}
