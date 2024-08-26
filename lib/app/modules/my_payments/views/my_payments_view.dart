import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/payment_operation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_payments_controller.dart';

class MyPaymentsView extends GetView<MyPaymentsController> {
  const MyPaymentsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'عمليات الدفع',
          style: TextStyle(fontFamily: Appfonts.boldFont),
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            color: appColors.secondColor,
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const PaymentOperation(
                cashAmount: "30,000",
                date: "15-6-2024",
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
