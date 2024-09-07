import 'package:baraka_trans/utilits/reservation_unit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../controllers/myreservations_controller.dart';

class MyreservationsView extends GetView<MyreservationsController> {
  const MyreservationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controll = Get.put(MyreservationsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('حجوزاتي'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: controll.fetchUserReservations(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/loading.json',
                    width: 100, height: 100),
              );
            }
            return SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ReservationDetails(
                            imageUrl: snapshot.data![index].bus.images[0],
                            routeName:
                                snapshot.data![index].busRoute.price.toString(),
                            routePrice:
                                snapshot.data![index].busRoute.price.toString(),
                            busTitle: snapshot.data![index].bus.type,
                            // arrivalDate: snapshot
                            //         .data![index].arrivalDepartures[0].date ??
                            //     "15",
                            // arrivalPoint: snapshot
                            //         .data![index].arrivalDepartures[0].date ??
                            //     'll',
                            // deptureDate: snapshot
                            //         .data![index].arrivalDepartures[0].date ??
                            //     'dd',
                            // depturePoint: snapshot
                            //         .data![index].arrivalDepartures[0].date ??
                            //     '',
                            status: snapshot.data![index].reservationStatus,
                            id: snapshot.data![index].id,
                            date: DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(
                                    snapshot.data![index].createdAt)),
                            busRiders: "50",
                            paymentMethod: 'جاري المعالجة',
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
