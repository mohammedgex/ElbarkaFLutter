import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/reservation_controller.dart';

class BasicReservationView extends GetView<ReservationController> {
  const BasicReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context)
                .unfocus(), // Dismiss the keyboard when tapping outside
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: screenHeight * 0.05, // Responsive top padding
                left: screenWidth * 0.03, // Responsive left padding
                right: screenWidth * 0.03, // Responsive right padding
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "يجب عليك ادخال جميع البيانات التالية بطريقة صحيحة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Appfonts.mainFont,
                        decorationColor: appColors.secondColor,
                        decoration: TextDecoration.underline,
                        fontSize: screenWidth * 0.04, // Responsive font size
                        color: appColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: appColors.borderColor,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textField(
                          hint_text: "اسم فندق مكة",
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            }
                            return "هذه القيمة لا يمكن ان تكون فارغة.";
                          },
                          value: (input) =>
                              controller.basicMaccaHotelName = input,
                          icon: Icon(
                            IconlyLight.home,
                            color: appColors.secondColor,
                            size: screenWidth * 0.06, // Responsive icon size
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        Center(
                          child: Icon(
                            IconlyLight.swap,
                            size: screenWidth * 0.06, // Responsive icon size
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        textField(
                          hint_text: "اسم فندق المدينة",
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            }
                            return "هذه القيمة لا يمكن ان تكون فارغة.";
                          },
                          value: (input) => controller.basicMaddinaName = input,
                          icon: Icon(
                            IconlyLight.home,
                            color: appColors.secondColor,
                            size: screenWidth * 0.06, // Responsive icon size
                          ),
                        ),
                        SizedBox(
                            height: screenHeight * 0.02), // Responsive spacing
                        Row(
                          children: [
                            Expanded(
                              child: textField(
                                hint_text: "عدد الركاب",
                                validation: (value) {
                                  if (value!.isNotEmpty &&
                                      int.parse(value) > 0) {
                                    return null;
                                  }
                                  return "هذه القيمة لا يمكن ان تكون فارغة.";
                                },
                                value: (input) =>
                                    controller.basicRidersCount = input,
                                type: TextInputType.number,
                                isTextCentered: true,
                                icon: Icon(
                                  IconlyLight.user_1,
                                  color: appColors.secondColor,
                                  size: screenWidth *
                                      0.06, // Responsive icon size
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.03), // Responsive spacing
                            Expanded(
                              child: textField(
                                hint_text: "عدد الحقائب",
                                validation: (value) {
                                  if (value!.isNotEmpty &&
                                      int.parse(value) > 0) {
                                    return null;
                                  }
                                  return "هذه القيمة لا يمكن ان تكون فارغة.";
                                },
                                value: (input) =>
                                    controller.basicBagsCount = input,
                                isTextCentered: true,
                                type: TextInputType.number,
                                icon: Icon(
                                  IconlyLight.bag_2,
                                  color: appColors.secondColor,
                                  size: screenWidth *
                                      0.06, // Responsive icon size
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Obx(() => InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controller.reservation();
                          }
                        },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Button(
                                raduis: 12,
                                title: "التالي",
                                // Responsive button text size
                              ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
