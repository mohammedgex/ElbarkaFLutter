import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:iconly/iconly.dart';
import '../controllers/transfers_controller.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';

class TransfersView extends GetView<TransfersController> {
  const TransfersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: appColors.secondColor,
          ),
        ),
        centerTitle: true,
        title: const Text('حجوزات التوصيلات'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: controller.fetchUserTransfers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Lottie.asset('assets/loading.json', width: 250, height: 250),
            );
          }

          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(child: Text("No transfers available"));
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Allows scroll in SingleChildScrollView
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final transfer = snapshot.data[index];
                final transportation = transfer.transportation;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://6874-188-40-217-164.ngrok-free.app/storage/${transportation.images[0]}",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: Container(
                                        width: 30,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: appColors.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "مؤكد",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: Appfonts.meduimFont,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "#${transfer.id}",
                                      style: const TextStyle(
                                        color: appColors.mainColor,
                                        fontSize: 14,
                                        fontFamily: Appfonts.meduimFont,
                                      ),
                                    ),
                                    _buildIconText(
                                      icon: IconlyLight.calendar,
                                      text: DateFormat('yyyy-MM-dd')
                                          .format(transfer.createdAt),
                                    ),
                                    _buildIconText(
                                      icon: IconlyLight.location,
                                      text: transfer.route.name,
                                    ),
                                    _buildIconText(
                                      icon: IconlyLight.work,
                                      text: transportation.type,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.TRANSFER_DETAILS,
                                  arguments: {
                                    "Images": transportation.images,
                                    "busId": transportation.id,
                                    "imageUrl": transportation.images[0],
                                    "tripNumber": transfer.tripNumber,
                                    "numberOfRiders": transfer.numberOfRiders,
                                    "travelAirlines": transfer.travelAirlines,
                                    "time": transfer.time,
                                    "date": transfer.date,
                                    "origin": transfer.origin,
                                    "destination": transfer.destination,
                                    "reservationStatus":
                                        transfer.reservationStatus,
                                         "paymentStatus": transfer.paymentStatus,
                                    
                                    "type": transportation.type,
                                    "routeName": transfer.route.name,
                                    "price": transfer.numberOfBags,
                                    "createdAt": transfer.createdAt,
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildIconText({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: appColors.textColor),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: Appfonts.meduimFont,
            color: appColors.textColor,
          ),
        ),
      ],
    );
  }
}
