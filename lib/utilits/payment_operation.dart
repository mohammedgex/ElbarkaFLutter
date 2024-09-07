import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PaymentOperation extends StatelessWidget {
  const PaymentOperation(
      {super.key, this.cashAmount, this.date, this.paymentMethod});

  final String? cashAmount;
  final String? date;
  final String? paymentMethod;

  @override
  Widget build(BuildContext context) {
    String extractDate(String dateTimeString) {
      // Parse the DateTime string
      DateTime dateTime = DateTime.parse(dateTimeString);

      // Format the DateTime to only include the date (YYYY-MM-DD)
      String formattedDate =
          "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

      return formattedDate;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: appColors.borderColor,
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: appColors.secondColor,
            ),
            child: const Icon(
              IconlyLight.wallet,
              color: Colors.white,
            ),
          ),
          Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: appColors.mainColor,
            ),
            child: Center(
                child: Text(
              paymentMethod! == "card"
                  ? "دفع بالكارت"
                  : paymentMethod == "manual"
                      ? "دفع يدوي"
                      : "خطأ",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: Appfonts.boldFont),
            )),
          ),
          const SizedBox(width: 10), // Add spacing between icon and text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${cashAmount!} جنية",
                style: const TextStyle(fontFamily: Appfonts.boldFont),
              ),
              Text(
                extractDate(date!),
                style:
                    const TextStyle(fontSize: 12, color: appColors.textColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
