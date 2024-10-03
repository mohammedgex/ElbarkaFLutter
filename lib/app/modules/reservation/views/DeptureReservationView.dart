import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import '../controllers/reservation_controller.dart';

class DeptureReservationView extends GetView<ReservationController> {
  const DeptureReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    print(controller.reservationId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
              screenWidth * 0.04), // Adjusted padding for better responsiveness
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "يرجي كتابة بيانات المغادرة بطريقة صحيحة.",
                  style: TextStyle(
                    fontFamily: Appfonts.mainFont,
                    decoration: TextDecoration.underline,
                    decorationColor: appColors.secondColor,
                    fontSize: 22, // Slightly increased font size
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Added spacing
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textField(
                        hint_text: "الخطوط الجوية",
                        validation: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "هذه القيمة لا يمكن ان تكون فارغة.";
                        },
                        value: (value) =>
                            controller.DeptureAirLinesName = value,
                        icon: const Icon(
                          IconlyLight.ticket,
                          color: appColors.secondColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const Center(child: Icon(IconlyLight.arrow_up_2)),
                      SizedBox(height: screenHeight * 0.02),
                      textField(
                        hint_text: "رقم الرحلة",
                        validation: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "هذه القيمة لا يمكن ان تكون فارغة.";
                        },
                        value: (value) =>
                            controller.DeptureAirLinesNumber = value,
                        icon: const Icon(
                          IconlyLight.send,
                          color: appColors.secondColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
                EasyDateTimeLine(
                  locale: "ar",
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    controller.deptureSelectedDate = selectedDate;
                  },
                  headerProps: const EasyHeaderProps(
                    monthPickerType: MonthPickerType.dropDown,
                    dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
                  ),
                  dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum,
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3371FF),
                            Color.fromARGB(255, 24, 64, 158),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TimePickerSpinnerPopUp(
                    mode: CupertinoDatePickerMode.time,
                    initTime: DateTime.now(),
                    minTime: DateTime.now().subtract(const Duration(days: 10)),
                    maxTime: DateTime.now().add(const Duration(days: 10)),
                    // //Barrier Color when pop up show
                    // minuteInterval: 1,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    cancelText: 'الغاء',
                    confirmText: 'تأكيد',
                    iconSize: 20,
                    pressType: PressType.singlePress,
                    timeFormat: 'HH:mm',
                    textStyle: const TextStyle(
                        fontFamily: Appfonts.mainFont,
                        color: appColors.secondColor),
                    // Customize your time widget
                    timeWidgetBuilder: (dateTime) {
                      // تأكد أن `dateTime` ليس null
                      // ننسق الوقت حسب ما نريد
                      String formattedTime =
                          DateFormat('HH:mm').format(dateTime);

                      // نعرض الوقت في ويدجت
                      return Container(
                        width: double.infinity,
                        height: 45,
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: appColors.secondColor)),
                        child: Center(
                          child: Text(
                            formattedTime,
                            style: const TextStyle(
                              fontFamily: Appfonts.mainFont,
                              color: appColors.secondColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                    onChange: (dateTime) {
                      print(dateTime);
                      controller.deptureSelectedTime = dateTime;
                    },
                  ),
                ),
                SizedBox(
                    height:
                        screenHeight * 0.02), // Added spacing before the button
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.arivalDepture(false);
                    }
                  },
                  child: const Button(
                    raduis: 12,
                    title: "التالي",
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
