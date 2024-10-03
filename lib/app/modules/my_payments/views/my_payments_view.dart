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
    MyPaymentsController getController = Get.put(MyPaymentsController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'عمليات الدفع',
            style: TextStyle(fontFamily: Appfonts.boldFont),
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: getController.fetchUserPayments(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/loading.json',
                    width: 250, height: 250),
              );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return const Text("لا توجد بيانات للعرض.");
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
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
                ),
              ),
            );
          },
        ));
  }
}
