import 'package:baraka_trans/consts/consts.dart';
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
    final controller = Get.put(MyreservationsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: FutureBuilder(
        future: controller.fetchUserReservations(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No reservations found.'));
          }

          return _buildReservationsList(context, snapshot.data!);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: InkWell(
        onTap: () => Get.back(),
        child: const Icon(
          Icons.arrow_back_ios,
          color: appColors.secondColor,
          size: 25,
        ),
      ),
      title: const Text('حجوزات الدورات'),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildReservationsList(
      BuildContext context, List<dynamic> reservations) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: reservations.length,
          itemBuilder: (context, index) {
            final reservation = reservations[index];
            List contactBooking = reservation.bookingContact;
            List images = reservation.bus.images;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReservationDetails(
                  imageUrl: reservation.bus.images[0],
                  routeName: reservation.busRoute.price.toString(),
                  routePrice: reservation.busRoute.price.toString(),
                  busTitle: reservation.bus.type,
                  arrivalDate:
                      _formatDate(reservation.arrivalDepartures[0].date),
                  arrivalPoint: " reservation.internalMovements[0].fromPlace",
                  deptureDate:
                      " _formatDate(reservation.arrivalDepartures[1].date)",
                  depturePoint: "reservation.internalMovements[1].toPlace",
                  status: reservation.reservationStatus,
                  id: reservation.id,
                  date: _formatDate(reservation.createdAt),
                  busRiders: reservation.bus.capacity.toString(),
                  paymentMethod: "test only",
                  paymentStatus: reservation.paymentStatus,
                  transportationId: reservation.bus.id,
                  contactBooking: contactBooking.isNotEmpty,
                  reservationId: reservation.id,
                  transportationImages: images.toList()),
            );
          },
        ),
      ),
    );
  }

  String _formatDate(String date) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/loading.json', width: 250, height: 250),
    );
  }
}
