import 'package:baraka_trans/utilits/reservation_unit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/myreservations_controller.dart';

class MyreservationsView extends GetView<MyreservationsController> {
  const MyreservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('حجوزاتي'),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ReservationDetails(),
          ],
        ),
      ),
    );
  }
}
