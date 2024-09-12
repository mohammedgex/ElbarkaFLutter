import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:get/get.dart';

class ShortRouteReservationController extends GetxController {
  // MaddinaVisits page
  String? maddinaFrom = "";
  String? maddinaTo = "";
  DateTime? maddinaVisitSelectedDate = DateTime.now();
  DateTime? maddinaVisitSelectedTime = DateTime.now();
  var selectedValue = transRoutes().obs;
  final Timecontroller = BoardDateTimeTextController();
  var transList = <transRoutes>[].obs;

  // List of routes for the dropdown
  final availableRoutes = [
    transRoutes(id: 1, name: 'Route 1', type: 'Type 1'),
    transRoutes(id: 2, name: 'Route 2', type: 'Type 2'),
    transRoutes(id: 3, name: 'Route 3', type: 'Type 3')
  ];

  void addTransaction(transRoutes route) {
    transList.add(route);
  }

  void setSelected(transRoutes value) {
    selectedValue.value = value;
  }
}
