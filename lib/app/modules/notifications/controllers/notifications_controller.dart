import 'dart:convert';
import 'package:baraka_trans/app/data/notificationModel.dart';
import 'package:baraka_trans/utilits/api_service.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<List> fetchUserNotification() async {
    List<notificationModel> notificationsList =
        []; // List of transportation models

    try {
      final response = await _apiService.get('user/notifications');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["notifications"];
        notificationsList =
            data.map((item) => notificationModel.fromJson(item)).toList();
      }
    } catch (e) {
      // Handle errors
      print('Failed to fetch transportation data: $e');
    }
    return notificationsList.reversed.toList();
  }

  String timeAgo(String time) {
    DateTime dateTime = DateTime.parse(time);
    DateTime now = DateTime.now();

    Duration difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      int years = difference.inDays ~/ 365;
      return 'منذ $years ${years == 1 ? 'سنة' : 'سنوات'}';
    } else if (difference.inDays >= 30) {
      int months = difference.inDays ~/ 30;
      return 'منذ $months ${months == 1 ? 'شهر' : 'شهور'}';
    } else if (difference.inDays >= 7) {
      int weeks = difference.inDays ~/ 7;
      return 'منذ $weeks ${weeks == 1 ? 'اسبوع' : 'اسابيع'}';
    } else if (difference.inDays > 0) {
      return 'منذ ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'ايام'}';
    } else if (difference.inHours > 0) {
      return 'منذ ${difference.inHours} ${difference.inHours == 1 ? 'ساعة' : 'ساعات'}';
    } else if (difference.inMinutes > 0) {
      return 'منذ ${difference.inMinutes} ${difference.inMinutes == 1 ? 'دقيقة' : 'دقائق'}';
    } else {
      return 'الان';
    }
  }
}
