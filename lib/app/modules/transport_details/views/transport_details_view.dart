import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:baraka_trans/utilits/feature.dart';
import 'package:baraka_trans/utilits/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/transport_details_controller.dart';
import 'package:baraka_trans/app/data/tranportaionModel.dart';

class TransportDetailsView extends GetView<TransportDetailsController> {
  const TransportDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final transData = Get.arguments;
    final List<String> features = transData["features"] ?? [];
    final List<transRoutes> routes = transData["routes"] ?? [];
    controller.routes = routes;
    final List<String> images = transData["Images"] ?? [];
    final String title = transData["title"] ?? '';
    final int busId = transData["busId"] ?? 1;
    final String description = transData["description"] ?? '';
    final String seats = transData["seats"] ?? '';
    final String speed = transData["speed"] ?? '';
    final String riders = transData["riders"] ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                                    color: Color.fromRGBO(46, 43, 43, 0.157),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ], borderRadius: BorderRadius.circular(6)),
                              child: FancyShimmerImage(
                                boxFit: BoxFit.cover,
                                imageUrl:
                                    "http://192.168.1.80:8000/uploads/$item",
                              ),
                            ))
                        .toList(),
                    carouselController: controller.carousel_controller,
                    options: CarouselOptions(
                        height: 350,
                        aspectRatio: 2,
                        enlargeCenterPage: true,
                        viewportFraction: 0.98,
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
                                    color: Color.fromRGBO(46, 43, 43, 0.157),
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
                                      color: Color.fromRGBO(46, 43, 43, 0.157),
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
                        dotHeight: 6,
                        dotWidth: 6,
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
                                    color: controller.current.value == index
                                        ? appColors
                                            .mainColor // Highlight the selected image
                                        : appColors.borderColor,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "http://192.168.1.80:8000/uploads/${images[index]}"),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
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
                      title,
                      style: const TextStyle(
                          fontFamily: Appfonts.meduimFont,
                          color: appColors.secondColor,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontFamily: Appfonts.mainFont,
                          color: appColors.textColor,
                          fontSize: 12),
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
                          text: "$seats مقعد",
                          svg_url: "assets/seats.svg",
                        ),
                        feature(
                          text: "$speed كم/س",
                          svg_url: "assets/speed.svg",
                        ),
                        feature(
                          text: "$riders راكب",
                          svg_url: "assets/persons.svg",
                        )
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
                            ...List.generate(features.length, (index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(features[index],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: appColors.textColor,
                                              fontFamily: Appfonts.mainFont)),
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
                            exitBottomSheetDuration:
                                const Duration(milliseconds: 250),
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ...List.generate(
                                            controller.routeCategory.length,
                                            (index) {
                                              
                                          return GestureDetector(
                                              onTap: () => controller
                                                  .selectedRouteTyp
                                                  .value = index,
                                              child: Obx(
                                                () => AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds:
                                                          300), // Animation duration

                                                  width: 120,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .selectedRouteTyp
                                                                  .value ==
                                                              index
                                                          ? appColors
                                                              .secondColor
                                                          : appColors
                                                              .borderColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                          .routeCategory[index],
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontFamily: Appfonts
                                                              .meduimFont),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        }),
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
                                            itemCount: routes.length,
                                            itemBuilder: (context, i) {
                                              return Obx(() => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .select_Route(i);
                                                        controller
                                                                .selectedRoute =
                                                            routes[controller
                                                                .Is_Selected
                                                                .value];
                                                      },
                                                      child: MyRotue(
                                                        isSelected: controller
                                                                .Is_Selected
                                                                .value ==
                                                            i,
                                                        routeName: routes[i]
                                                            .name
                                                            .toString(),
                                                        price:
                                                            "${routes[i].pivot!.price.toString()} ريال",
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {

                                            Get.toNamed(
                                                controller.selectedRoute!
                                                            .type ==
                                                        "قطعة"
                                                    ? Routes.MY_PAYMENTS
                                                    : Routes.NOTES,
                                                arguments: {
                                                  "selectedRouteId": controller
                                                      .selectedRoute!.id,
                                                  "busId": busId,
                                                  "amountSR": controller
                                                      .selectedRoute!
                                                      .pivot!
                                                      .price!
                                                      .toDouble(),
                                                  "routeType": controller
                                                      .selectedRoute!.type
                                                });
                                          },
                                          child: const Button(
                                            title: "تأكيد المسار",
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
                                    color: Color.fromRGBO(146, 143, 143, 0.16),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              "الخطوة التالية",
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
        ),
      ),
    );
  }
}
