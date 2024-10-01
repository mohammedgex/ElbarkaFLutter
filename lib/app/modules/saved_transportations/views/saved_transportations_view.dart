import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import '../controllers/saved_transportations_controller.dart';

class SavedTransportationsView extends GetView<SavedTransportationsController> {
  SavedTransportationsView({super.key});
  final savedTransportationsController =
      Get.put(SavedTransportationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'المحفوظات',
          style: TextStyle(fontFamily: Appfonts.boldFont),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: savedTransportationsController.fetchUserFavoritesList(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Lottie.asset('assets/loading.json', width: 250, height: 250),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Text("لا توجد بيانات للعرض.");
          }
          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => BookmarkedUnit(
                      riders: snapshot.data![index].capacity,
                      seats: snapshot.data![index].luggageCapacity,
                      url: snapshot.data![index].images[0],
                      routesLength: 12,
                      title: snapshot.data![index].type,
                      id: snapshot.data![index].id,
                      availble: snapshot.data![index].isAvailable,
                      controller: controller,
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                )),
          );
        },
      ),
    );
  }
}

class BookmarkedUnit extends StatelessWidget {
  const BookmarkedUnit(
      {super.key,
      this.id,
      this.riders,
      this.routesLength,
      this.seats,
      this.url,
      this.availble,
      this.controller,
      this.title});

  final int? id;
  final String? title;
  final int? riders;
  final int? seats;
  final int? routesLength;
  final String? url;
  final bool? availble;
  final SavedTransportationsController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const []),
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
                                "https://6874-188-40-217-164.ngrok-free.app/storage/$url"))),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      width: 60,
                      height: 15,
                      decoration: BoxDecoration(
                          color: appColors.mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          availble! ? "متاح للحجز" : "غير متاح",
                          style: const TextStyle(
                              fontSize: 10,
                              fontFamily: Appfonts.lightFont,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      title!,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: appColors.mainColor,
                          fontSize: 14,
                          fontFamily: Appfonts.boldFont),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyLight.user_1,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Center(
                        child: Text(
                          "$riders راكب",
                          style: const TextStyle(
                              fontSize: 11,
                              // color: appColors.mainColor,
                              fontFamily: Appfonts.lightFont),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(IconlyLight.user,
                          size: 16, color: appColors.textColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "$seats مقعد",
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: Appfonts.lightFont,
                          // color: appColors.mainColor
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(IconlyLight.location,
                          size: 16, color: appColors.textColor),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "$routesLength مسارات",
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: Appfonts.lightFont,
                          // color: appColors.mainColor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          InkWell(
              onTap: () {
                controller!.removeFromFavorite(id!, context);
                Get.offAndToNamed(Routes.SAVED_TRANSPORTATIONS);
              },
              child: const Icon(
                Icons.bookmark,
                size: 26,
                color: appColors.secondColor,
              ))
        ],
      ),
    );
  }
}
