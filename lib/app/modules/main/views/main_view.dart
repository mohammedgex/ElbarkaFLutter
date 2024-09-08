import 'package:baraka_trans/app/data/all_categories.dart';
import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/BusUnit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    controller.fetchUserData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Obx(() {
          if (controller.isloading!.value) {
            return Row(
              children: [
                const CircleAvatar(
                  backgroundColor: appColors.borderColor,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 200,
                  height: 20,
                  color: appColors.borderColor,
                ),
              ],
            );
          } else if (controller.userData.value.name.isNotEmpty) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "http://192.168.1.80:8000/uploads/${controller.userData.value.image}",
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "اهلا بك يا ",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Appfonts.meduimFont,
                  ),
                ),
                Text(
                  controller.userData.value.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: appColors.secondColor,
                    fontFamily: Appfonts.boldFont,
                  ),
                ),
              ],
            );
          }
          return const Text("no data");
        }),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
              child: SvgPicture.asset("assets/icons/notification.svg"),
            ),
          ),
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: appColors.mainColor,
                  endIndent: 24,
                  height: 1,
                  thickness: 1,
                ),
                const Text(
                  "المنصة الاسهل",
                  style: TextStyle(
                    color: appColors.mainColor,
                    fontSize: 22,
                    fontFamily: Appfonts.boldFont,
                  ),
                ),
                const Text(
                  "لحجز تشغيلات باصات بأجراءات بسيطة",
                  style: TextStyle(
                    fontSize: 12,
                    color: appColors.textColor,
                    fontFamily: Appfonts.lightFont,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Swiper(
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: SwiperPagination.dots,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return FancyShimmerImage(
                        height: 200,
                        width: double.infinity,
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        boxFit: BoxFit.cover,
                        imageUrl:
                            "https://egsky.net/wp-content/uploads/2022/09/%D8%AA%D8%A3%D8%AC%D9%8A%D8%B1-%D8%B3%D9%8A%D8%A7%D8%B1%D8%A7%D8%AA-%D8%A7%D9%84%D8%B1%D9%8A%D8%A7%D8%B6-1.jpg",
                      );
                    },
                    itemCount: 3,
                    viewportFraction: 1,
                    scale: 0.7,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: controller.fetchCategories(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Lottie.asset('assets/loading.json',
                            width: 100, height: 100),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.none ||
                        !snapshot.hasData) {
                      return const Center(child: Text("لا توجد بيانات للعرض."));
                    }

                    final categories = [
                      AllCategories(name: "الكل"),
                      ...snapshot.data,
                    ];

                    return SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(4),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Obx(() => InkWell(
                                onTap: () {
                                  controller.selectCategory(index);
                                  controller.selectedCategory.value =
                                      categories[index].name ?? "الكل";
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  padding: const EdgeInsets.all(4),
                                  width: controller.selectedIndex.value == index
                                      ? 90
                                      : 70,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        color:
                                            Color.fromRGBO(146, 143, 143, 0.16),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    color:
                                        controller.selectedIndex.value == index
                                            ? appColors.mainColor
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      categories[index].name,
                                      style: TextStyle(
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? Colors.white
                                            : appColors.textColor,
                                        fontSize: 12,
                                        fontWeight:
                                            controller.selectedIndex.value ==
                                                    index
                                                ? FontWeight.w500
                                                : FontWeight.w300,
                                        fontFamily: Appfonts.meduimFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 5);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                // Updated ListView to be scrollable
                FutureBuilder(
                    future: controller.selectedCategory.value == 'الكل'
                        ? controller.fetchTransportationData()
                        : controller.fetchTransportationsById(
                            controller.selectedIndex.value),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Lottie.asset('assets/loading.json',
                              width: 100, height: 100),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.none ||
                          !snapshot.hasData) {
                        return const Center(
                            child: Text("لا توجد بيانات للعرض."));
                      }
                      final transportationData =
                          snapshot.data as List<dynamic>?;

                      return SizedBox(
                        width: double.infinity,
                        child: ListView.separated(
                          physics:
                              const ClampingScrollPhysics(), // Allows scrolling
                          shrinkWrap:
                              true, // Ensures ListView takes up only as much space as needed
                          itemCount: transportationData?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final data = transportationData![index];
                            return BusUnit(
                              controller: controller,
                              imageUrl:
                                  "http://192.168.1.80:8000/uploads/${data.images[0]}",
                              speed: data.maxSpeed.toString(),
                              seatsCount: data.luggageCapacity.toString(),
                              rdiersCount: data.capacity.toString(),
                              title: data.type,
                              isAvailable: data.isAvailable,
                              Images: data.images,
                              features: data.features,
                              description: data.type,
                              busId: data.id,
                              routes: data.routes,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 20);
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
