import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/reservation_controller.dart';

class MeccaVisitsReservationView extends GetView<ReservationController> {
  const MeccaVisitsReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();

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
                  "يرجي كتابة بيانات مزارات مكة بطريقة صحيحة.",
                  style: TextStyle(
                      fontFamily: Appfonts.mainFont,
                      decoration: TextDecoration.underline,
                      decorationColor: appColors.secondColor,
                      fontSize: 16, // Slightly increased font size
                      color: appColors.textColor),
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
                        hint_text: "من",
                        value: (value) => controller.MeccaFrom = value,
                        validation: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "هذه القيمة لا يمكن ان تكون فارغة.";
                        },
                        icon: const Icon(
                          IconlyLight.ticket,
                          color: appColors.secondColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const Center(child: Icon(IconlyLight.arrow_up_2)),
                      SizedBox(height: screenHeight * 0.02),
                      textField(
                        hint_text: "الي",
                        value: (value) => controller.MeccaTo = value,
                        validation: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "هذه القيمة لا يمكن ان تكون فارغة.";
                        },
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
                    controller.meccaVisitSelectedDate = selectedDate;
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
                BoardDateTimeInputField(
                  showPicker: true,
                  showPickerType: BoardDateTimeFieldPickerType.standard,
                  controller: controller.Timecontroller,
                  initialDate: DateTime.now(),
                  keyboardType: TextInputType.none,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                  decoration: const InputDecoration(
                      label: Text("توقيت الوصول"),
                      suffixIcon: Icon(
                        IconlyLight.time_square,
                        color: appColors.secondColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: appColors.secondColor, width: 0.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: appColors.mainColor, width: 0.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: appColors.secondColor, width: 0.5))),
                  pickerType: DateTimePickerType.time,
                  options: const BoardDateTimeOptions(
                      languages: BoardPickerLanguages.en(),
                      textColor: Colors.black,
                      foregroundColor: appColors.secondColor,
                      activeColor: Colors.white,
                      backgroundColor: Colors.white,
                      boardTitle: "اختر توقيت الوصول",
                      boardTitleTextStyle: TextStyle(
                          fontSize: 14, fontFamily: Appfonts.boldFont),
                      inputable: false),
                  onChanged: (date) {
                    controller.meccaVisitSelectedTime = date;
                  },
                  onFocusChange: (val, date, text) {
                    print('on focus changed date: $val, $date, $text');
                  },
                ),
                SizedBox(
                    height:
                        screenHeight * 0.02), // Added spacing before the button
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // controller.arivalDepture(true);
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.slowMiddle,
                      );
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
