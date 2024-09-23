import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:baraka_trans/utilits/feature.dart';
import 'package:baraka_trans/utilits/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/transport_details_controller.dart';
import 'package:baraka_trans/app/data/tranportaionModel.dart';

class TransportDetailsView extends GetView<TransportDetailsController> {
  const TransportDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final transData = Get.arguments;
    // final List<transRoutes> routes = transData["routes"] ?? [];
    // final List<transRoutes> turnRoutes =
    //     transData["routes"].where((route) => route.type == "دورة").toList() ??
    //         [];
    // controller.routes = routes;
    final List<String> images = transData["Images"] ?? [];
    final int busId = transData["busId"] ?? 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: controller.fetchBusData(busId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset('assets/loading.json',
                        width: 200, height: 200),
                  ),
                ],
              );
            }
            controller.routes = snapshot.data.routes;
            final List<transRoutes> turnRoutes = snapshot.data.routes
                    .where((route) => route.type == "دورة")
                    .toList() ??
                [];
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        items: images
                            .map((item) => Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        color:
                                            Color.fromRGBO(46, 43, 43, 0.157),
                                        blurRadius: 2,
                                        spreadRadius: 2)
                                  ], borderRadius: BorderRadius.circular(6)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                        loadingBuilder:
                                            (BuildContext context,
                                                Widget child,
                                                ImageChunkEvent?
                                                    loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child; // Image is fully loaded
                                      } else {
                                        // Display a loading indicator
                                        return Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: appColors.textColor,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        );
                                      }
                                    },
                                        fit: BoxFit.cover,
                                        "https://6874-188-40-217-164.ngrok-free.app/storage/$item"),
                                  ),
                                ))
                            .toList(),
                        carouselController: controller.carousel_controller,
                        options: CarouselOptions(
                            height: 350,
                            enableInfiniteScroll: false,
                            aspectRatio: 2,
                            enlargeCenterPage: true,
                            initialPage: 0,
                            viewportFraction: 0.97,
                            onPageChanged: (index, reason) {
                              controller.chng(index);
                            }),
                      ),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        color:
                                            Color.fromRGBO(46, 43, 43, 0.157),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: appColors.secondColor,
                              )),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            controller.addToFavorite(busId, context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 0),
                                          color:
                                              Color.fromRGBO(46, 43, 43, 0.157),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  Icons.bookmark,
                                  color: appColors.secondColor,
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Container(
                          width: 150,
                          height: 22,
                          decoration: BoxDecoration(
                              color: appColors.mainColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              snapshot.data.compnay_name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: Appfonts.lightFont,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: controller.current.value,
                          count: images.length,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 4,
                            dotWidth: 5,
                            activeDotColor: appColors.mainColor,
                            dotColor: appColors.borderColor,
                          ),
                          onDotClicked: (index) {
                            controller.carousel_controller.animateToPage(index);
                          },
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.carousel_controller.animateToPage(
                                      index); // Navigate the carousel to the tapped image
                                  controller
                                      .chng(index); // Update the current index
                                },
                                child: Obx(() {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: controller.current.value == index
                                            ? 2
                                            : 0,
                                        color: controller.current.value == index
                                            ? appColors
                                                .mainColor // Highlight the selected image
                                            : appColors.borderColor,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://6874-188-40-217-164.ngrok-free.app/storage/${snapshot.data.images[index]}"),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            itemCount: images.length),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.type,
                          style: const TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.secondColor,
                              fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            snapshot.data.description,
                            style: const TextStyle(
                                fontFamily: Appfonts.lightFont,
                                color: appColors.textColor,
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "مميزات وسيلة النقل",
                          style: TextStyle(
                              fontFamily: Appfonts.meduimFont,
                              color: appColors.secondColor,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            feature(
                              text:
                                  "${snapshot.data.luggageCapacity.toString()} مقعد",
                              svg_url: "assets/seats.svg",
                            ),
                            feature(
                              text: "${snapshot.data.maxSpeed.toString()} كم/س",
                              svg_url: "assets/speed.svg",
                            ),
                            feature(
                              text: "${snapshot.data.capacity.toString()} راكب",
                              svg_url: "assets/persons.svg",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // =========================
                        // features
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8),
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.5, color: appColors.mainColor),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(snapshot.data.features.length,
                                    (index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(snapshot.data.features[index],
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: appColors.textColor,
                                                  fontFamily:
                                                      Appfonts.mainFont)),
                                        ],
                                      ),
                                      const Text(
                                        "متوفر",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: Appfonts.meduimFont),
                                      )
                                    ],
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                        // =============== اختيار المسارات
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                                Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: appColors.secondColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12)),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "الدورات المرتبطة بهذه الوسيلة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      Appfonts.lightFont),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Container(
                                        width: double.infinity,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: turnRoutes.length,
                                                itemBuilder: (context, i) {
                                                  return Obx(() => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller
                                                                .select_Route(
                                                                    i);
                                                            controller
                                                                    .selectedRoute =
                                                                turnRoutes[
                                                                    controller
                                                                        .Is_Selected
                                                                        .value];
                                                          },
                                                          child: MyRotue(
                                                            isSelected: controller
                                                                    .Is_Selected
                                                                    .value ==
                                                                i,
                                                            routeName:
                                                                turnRoutes[i]
                                                                    .name
                                                                    .toString(),
                                                            price:
                                                                "${turnRoutes[i].pivot!.price.toString()} ريال",
                                                          ),
                                                        ),
                                                      ));
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.offAllNamed(
                                                            Routes.NOTES,
                                                            arguments: {
                                                              "selectedRouteId":
                                                                  controller
                                                                      .selectedRoute!
                                                                      .id,
                                                              "busId": busId,
                                                              "amountSR": controller
                                                                  .selectedRoute!
                                                                  .pivot!
                                                                  .price!
                                                                  .toDouble(),
                                                              "routeType":
                                                                  controller
                                                                      .selectedRoute!
                                                                      .type,
                                                              "routes": snapshot
                                                                  .data.routes
                                                                  .where((route) =>
                                                                      route
                                                                          .type ==
                                                                      "دورة")
                                                                  .toList()
                                                            });
                                                      },
                                                      child: const Button(
                                                        title: "تأكيد المسار",
                                                        raduis: 8,
                                                        Btncolor: appColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () => Get.offAllNamed(
                                                          Routes
                                                              .SHORT_ROUTE_RESERVATION,
                                                          arguments: {
                                                            "selectedRouteId":
                                                                controller
                                                                    .selectedRoute!
                                                                    .id,
                                                            "busId": busId,
                                                            "amountSR": controller
                                                                .selectedRoute!
                                                                .pivot!
                                                                .price!
                                                                .toDouble(),
                                                            "routeType": controller
                                                                .selectedRoute!
                                                                .type,
                                                            "routes": snapshot
                                                                .data.routes
                                                                .where((route) =>
                                                                    route
                                                                        .type ==
                                                                    "قطعة")
                                                                .toList()
                                                          }),
                                                      child: const Button(
                                                        raduis: 8,
                                                        title: "اختار توصيلة",
                                                        Btncolor:
                                                            appColors.mainColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                enterBottomSheetDuration:
                                    const Duration(milliseconds: 500),
                                elevation: 1);
                            controller.InitalRoute();
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: appColors.secondColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        color:
                                            Color.fromRGBO(146, 143, 143, 0.16),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  "اختيار مسار",
                                  style: TextStyle(
                                      fontFamily: Appfonts.meduimFont,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
