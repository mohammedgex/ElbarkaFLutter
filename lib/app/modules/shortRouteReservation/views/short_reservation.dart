import 'package:baraka_trans/app/modules/shortRouteReservation/controllers/short_route_reservation_controller.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/TextField.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';

class ShortReservationView extends GetView<ShortRouteReservationController> {
  const ShortReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    final getController = Get.put(ShortRouteReservationController());
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final args = Get.arguments;
    getController.busId = args["busId"];
    print(getController.busId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColors.mainColor,
        elevation: 0,
        title: Text(
          "${getController.routeIndex.value + 1} / ${getController.newSelectedRoutes.length} من التوصيلات",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: Appfonts.mainFont,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.offAllNamed(Routes.HOME),
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
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Route Information
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "يرجي كتابة بيانات المسار رقم ${getController.routeIndex.value + 1}",
                        style: const TextStyle(
                          fontFamily: Appfonts.mainFont,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                        width: screenWidth * 0.85,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: appColors.mainColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "${getController.newSelectedRoutes[getController.routeIndex.value].name} ",
                            style: const TextStyle(
                                fontFamily: Appfonts.lightFont,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      )
                    ],
                  );
                }),

                SizedBox(height: screenHeight * 0.02),
                // Form Inputs
                buildFormInputs(getController, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                // Date and Time Selection
                buildDateAndTimeInputs(getController, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                // Submit Button
                InkWell(
                  onTap: () async {
                    // Form Validation
                    if (_formKey.currentState!.validate()) {
                      await getController.reservation(context);
                      if (getController.routeIndex <
                          getController.newSelectedRoutes.length - 1) {
                        getController.routeIndex++;

                        Get.offAndToNamed(Routes.SHORT_RESERVATION,
                            arguments: {"busId": getController.busId});
                        getController.newSelectedRoutes =
                            getController.newSelectedRoutes;
                        getController.AirLinesName = "";
                        getController.TripNumber = "";
                        getController.destination = "";
                        getController.orign = "";
                        getController.numberOfBags = "";
                        getController.numberOfRiders = "";
                      } else {
                        Get.toNamed(Routes.PAYMENTMETHODS, arguments: {
                          "reservationId": 1,
                          "amountEGP": 2500.0,
                          "isTransfer": true,
                          "amountSR": double.parse(
                              getController.price.value.toString()),
                        });
                      }
                    }
                  },
                  child: Obx(
                    () => getController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: appColors.secondColor,
                          )
                        : const Button(
                            raduis: 12,
                            title: "التالي",
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Extract form inputs to keep build method clean
  Widget buildFormInputs(
      ShortRouteReservationController getController, double screenHeight) {
    return Column(
      children: [
        textField(
          hint_text: "الخطوط الجوية",
          validation: (value) {
            if (value!.isNotEmpty) {
              return null;
            }
            return "هذه القيمة لا يمكن ان تكون فارغة.";
          },
          value: (value) => getController.AirLinesName = value,
          icon: const Icon(
            IconlyLight.ticket,
            color: appColors.secondColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        textField(
          hint_text: "رقم الرحلة",
          validation: (value) {
            if (value!.isNotEmpty) {
              return null;
            }
            return "هذه القيمة لا يمكن ان تكون فارغة.";
          },
          value: (value) => getController.TripNumber = value,
          icon: const Icon(
            IconlyLight.send,
            color: appColors.secondColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          children: [
            Expanded(
              child: textField(
                hint_text: "من النقطة",
                validation: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  }
                  return "هذه القيمة لا يمكن ان تكون فارغة.";
                },
                value: (value) => getController.orign = value,
                icon: const Icon(
                  IconlyLight.location,
                  color: appColors.secondColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: textField(
                hint_text: "الي الوصول",
                validation: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  }
                  return "هذه القيمة لا يمكن ان تكون فارغة.";
                },
                value: (value) => getController.destination = value,
                icon: const Icon(
                  IconlyLight.location,
                  color: appColors.secondColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        textField(
          hint_text: "عدد الركاب",
          validation: (value) {
            if (value!.isNotEmpty) {
              return null;
            }
            return "هذه القيمة لا يمكن ان تكون فارغة.";
          },
          value: (value) => getController.numberOfRiders = value,
          icon: const Icon(
            IconlyLight.user_1,
            color: appColors.secondColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        textField(
          hint_text: "عدد الحقائب",
          validation: (value) {
            if (value!.isNotEmpty) {
              return null;
            }
            return "هذه القيمة لا يمكن ان تكون فارغة.";
          },
          value: (value) => getController.numberOfBags = value,
          icon: const Icon(
            IconlyLight.bag_2,
            color: appColors.secondColor,
          ),
        ),
      ],
    );
  }

  // Extract date and time selection to keep build method clean
  Widget buildDateAndTimeInputs(
      ShortRouteReservationController getController, double screenHeight) {
    return Column(
      children: [
        EasyDateTimeLine(
          locale: "ar",
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            getController.SelectedDate = selectedDate;
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
          controller: getController.Timecontroller,
          initialDate: DateTime.now(),
          keyboardType: TextInputType.none,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          decoration: const InputDecoration(
              label: Text("توقيت الوصول"),
              suffixIcon: Icon(
                IconlyLight.time_square,
                color: appColors.secondColor,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: appColors.secondColor, width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: appColors.mainColor, width: 0.5)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: appColors.secondColor, width: 0.5))),
          pickerType: DateTimePickerType.time,
          options: const BoardDateTimeOptions(
            languages: BoardPickerLanguages.en(),
            textColor: Colors.black,
            foregroundColor: appColors.secondColor,
            activeColor: Colors.white,
            backgroundColor: Colors.white,
            boardTitle: "اختر توقيت الوصول",
            boardTitleTextStyle:
                TextStyle(fontSize: 14, fontFamily: Appfonts.boldFont),
          ),
          onChanged: (date) {
            getController.SelectedTime = date;
          },
        ),
      ],
    );
  }
}
