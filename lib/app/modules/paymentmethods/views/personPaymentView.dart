import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:datetime_picker_field_platform/datetime_picker_field_platform.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controllers/paymentmethods_controller.dart';

class personPaymentView extends GetView<PaymentmethodsController> {
  const personPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.secondColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "الدفع للمندوب",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Column(
                children: [
                  const textField(
                    hint_text: "العنوان بالكامل",
                    icon: Icon(
                      IconlyLight.location,
                      color: appColors.secondColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  DateTimeFieldPlatform(
                    title: "اختر توقيت التسليم",
                    textCancel: "الغاء",
                    textConfirm: "تأكيد",
                    mode: DateMode.time,
                    titleStyle: const TextStyle(
                        fontSize: 16, fontFamily: Appfonts.boldFont),
                    decoration: const InputDecoration(
                      hintText: 'اختر التوقيت المناسب',
                      prefixIcon: Icon(
                        IconlyLight.time_square,
                        color: appColors.secondColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: appColors.secondColor, width: 0.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: appColors.mainColor, width: 1)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: appColors.secondColor, width: 0.5)),
                    ),
                    maximumDate: DateTime.now().add(const Duration(days: 720)),
                    minimumDate: DateTime.utc(2009),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  EasyDateTimeLine(
                    locale: "ar",
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
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
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              const Button(
                title: "تاكيد",
                raduis: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
