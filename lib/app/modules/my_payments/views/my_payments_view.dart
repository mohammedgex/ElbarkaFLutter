import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/payment_operation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/my_payments_controller.dart';

class MyPaymentsView extends GetView<MyPaymentsController> {
  const MyPaymentsView({
    super.key,
  });

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: controller.fetchUserPayments(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/loading.json',
                        width: 100, height: 100),
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return PaymentOperation(
                            cashAmount: snapshot.data![index].amount,
                            date: snapshot.data![index].createdAt,
                            paymentMethod: snapshot.data![index].paymentType,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
