import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/BusUnit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg/1200px-Andrzej_Person_Kancelaria_Senatu.jpg",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "اهلا بك يا ",
              style: TextStyle(fontSize: 12, fontFamily: Appfonts.meduimFont),
            ),
            Text(
              "محمد",
              style: TextStyle(
                fontSize: 16,
                color: appColors.secondColor,
                fontFamily: Appfonts.boldFont,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
              child: SvgPicture.asset("assets/icons/notification.svg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                  fontFamily: Appfonts.mainFont,
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
              SizedBox(
                width: double.infinity,
                height: 35,
                child: ListView.separated(
                  padding: const EdgeInsets.all(4),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.Categories.length,
                  itemBuilder: (context, index) {
                    return Obx(() => InkWell(
                          onTap: () => controller.selectCategory(index),
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
                                  color: Color.fromRGBO(146, 143, 143, 0.16),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: controller.selectedIndex.value == index
                                  ? appColors.mainColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                controller.Categories[index],
                                style: TextStyle(
                                  color: controller.selectedIndex.value == index
                                      ? Colors.white
                                      : appColors.textColor,
                                  fontSize: 12,
                                  fontWeight:
                                      controller.selectedIndex.value == index
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
              ),
              const SizedBox(height: 12),
              // Updated ListView to be scrollable
              SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(), // Allows scrolling
                  shrinkWrap:
                      true, // Ensures ListView takes up only as much space as needed
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return BusUnit(
                      controller: controller,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
