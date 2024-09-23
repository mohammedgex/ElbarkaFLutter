import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/paymentmethods_controller.dart';

class Self_paymentView extends GetView<PaymentmethodsController> {
  const Self_paymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.secondColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "الدفع بمقر الشركة",
          style: TextStyle(
            color: Colors.white,
            fontFamily: Appfonts.mainFont,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            color: Colors.white,
            Icons.cancel,
            size: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
                initialCenter: LatLng(30.0634136, 31.3318302), initialZoom: 18),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: const LatLng(30.0634136, 31.3318302),

                    // center of 't Gooi
                    radius: 50,
                    useRadiusInMeter: true,
                    color: appColors.secondColor.withOpacity(0.3),
                    borderColor: appColors.secondColor.withOpacity(0.7),
                    borderStrokeWidth: 2,
                  )
                ],
              )
            ],
          ),
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                controller.paymentInCompanyRequest(context);
                controller.openGoogleMaps(30.0634136, 31.3318302);
              },
              child: const Button(
                raduis: 12,
                Btncolor: appColors.secondColor,
                title: "تأكيد وعرض علي الخريطة",
              ),
            ),
          )
        ],
      ),
    );
  }
}
