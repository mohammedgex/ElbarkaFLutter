import 'package:baraka_trans/app/data/tranportaionModel.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/short_route_reservation_controller.dart';

class ShortRouteReservationView
    extends GetView<ShortRouteReservationController> {
  const ShortRouteReservationView({super.key});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final controll = Get.put(ShortRouteReservationController());

    // print(controller.reservationId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.mainColor,
        centerTitle: true,
        title: const Text(
          "اختيار عدة مسارات",
          style: TextStyle(
              color: Colors.white, fontFamily: Appfonts.mainFont, fontSize: 18),
        ),
        leading: InkWell(
          onTap: () => Get.dialog(
            AlertDialog(
              title: const Center(
                child: Text(
                  'اختر وصلة',
                  style: TextStyle(color: appColors.mainColor),
                ),
              ),
              content: Obx(() => DropdownButton<transRoutes>(
                    underline: null,
                    isExpanded: true,
                    value: controll.selectedValue.value.id == null
                        ? null
                        : controll.selectedValue.value,
                    hint: const Text('اختر وصلة'),
                    items: controll.availableRoutes.map((transRoutes route) {
                      return DropdownMenuItem<transRoutes>(
                        value: route,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(route.name!),
                            Text(route.type!),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controll.setSelected(newValue!);
                    },
                  )),
              actions: [
                GestureDetector(
                    onTap: () {
                      if (controll.selectedValue.value.id != null) {
                        controll.addTransaction(controll.selectedValue.value);
                        Get.back();
                      }
                    },
                    child: const Button(
                      title: "اضافة",
                      raduis: 12,
                    ))
              ],
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
            10), // Adjusted padding for better responsiveness
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(132, 81, 30, 176),
                        offset: Offset(2, 4))
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 156, 102, 21),
                      appColors.secondColor
                    ], // Replace with your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "السعر الاجمالي :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: Appfonts.lightFont,
                          decorationColor: appColors.secondColor,
                          fontSize: 15, // Slightly increased font size
                          color: appColors.textColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "5000 ريال",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: Appfonts.mainFont,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.008),
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.8,
                  child: Obx(() => ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        itemCount: controll.transList.length,
                        itemBuilder: (context, index) {
                          return addedRoutes(screenHeight: screenHeight);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: screenHeight * 0.01);
                        },
                      )),
                ),
                const Positioned(
                  bottom: 0,
                  left: 5,
                  right: 5,
                  child: Button(
                    raduis: 12,
                    title: "التالي",
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class addedRoutes extends StatelessWidget {
  const addedRoutes({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.07,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: appColors.borderColor,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 167, 102, 4),
              Color.fromARGB(155, 41, 33, 33)
            ], // Replace with your gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("قاهرة - جدة"),
          Text("5000 ريال"),
        ],
      ),
    );
  }
}
