import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/reservation_controller.dart';

class BasicReservationView extends GetView<ReservationController> {
  const BasicReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                Text(
                  "يجب عليك ادخال جميع البيانات التالية بطريقة صحيحة",
                  style: TextStyle(
                    fontFamily: Appfonts.mainFont,
                    fontSize: screenWidth * 0.04, // Responsive font size
                    color: appColors.textColor,
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
                              type: TextInputType.number,
                              isTextCentered: true,
                              icon: Icon(
                                IconlyLight.user_1,
                                color: appColors.secondColor,
                                size:
                                    screenWidth * 0.06, // Responsive icon size
                              ),
                            ),
                          ),
                          SizedBox(
                              width: screenWidth * 0.03), // Responsive spacing
                          Expanded(
                            child: textField(
                              hint_text: "عدد الحقائب",
                              isTextCentered: true,
                              type: TextInputType.number,
                              icon: Icon(
                                IconlyLight.bag_2,
                                color: appColors.secondColor,
                                size:
                                    screenWidth * 0.06, // Responsive icon size
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                InkWell(
                  onTap: () => controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: const Button(
                    raduis: 12,
                    title: "التالي",
                    // Responsive button text size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
