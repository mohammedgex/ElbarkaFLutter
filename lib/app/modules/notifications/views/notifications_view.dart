import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاشعارات'),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            color: appColors.secondColor,
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
      ),
      body: FutureBuilder(
        future: controller.fetchUserNotification(),
        builder: (context, snapshot) {
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      // physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return notifyWidget(
                          title: snapshot.data![index].title,
                          content: snapshot.data![index].content,
                          time: controller
                              .timeAgo(snapshot.data![index].createdAt),
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
      ),
    );
  }
}

class notifyWidget extends StatelessWidget {
  const notifyWidget({super.key, this.content, this.title, this.time});

  final String? title;
  final String? content;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: appColors.secondColor),
            child: const Icon(
              IconlyBold.notification,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content!,
                  style: const TextStyle(fontFamily: Appfonts.lightFont),
                )
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(
              width: 6,
            ),
          ),
          Expanded(
            child: Text(
              time!,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
