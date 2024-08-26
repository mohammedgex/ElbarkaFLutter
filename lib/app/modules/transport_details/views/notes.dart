import 'package:baraka_trans/app/routes/app_pages.dart';
import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:baraka_trans/utilits/button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transport_details_controller.dart';

class NotesView extends GetView<TransportDetailsController> {
  const NotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: appColors.secondColor,
                child: FancyShimmerImage(
                  imageUrl:
                      'https://i0.wp.com/arabic-guide.com/wp-content/uploads/2024/06/%D8%A8%D9%8A%D8%AC%D9%88-%D8%AA%D8%B1%D9%81%D9%84%D8%B1-1024x1024.jpeg?resize=1024%2C1024&ssl=1',
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 4,
                          blurRadius: 4,
                          color: Color.fromARGB(172, 221, 215, 215)),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "خطوات الحجز ببساطة",
                          style: TextStyle(
                              color: appColors.secondColor,
                              fontSize: 22,
                              fontFamily: Appfonts.boldFont),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            style: TextStyle(
                                fontSize: 12, color: appColors.textColor),
                            "تم تطوير مولد النصوص ليساعدك في الحصول على نص جاهز لملئ فراغات التصميم، حيث في بعض الأحيان تحتاج إلى وضع بعض النصوص في التصاميم كنصوص تجريبية يمكن استبدالها في نفس المساحة، هذه الآداة تمكنك من فعل ذلك."),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: appColors.mainColor),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(3, (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: appColors.secondColor,
                                      borderRadius: BorderRadius.circular(500)),
                                  child: Center(
                                      child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "حدد مواعيد الوصول والمغادرة من والي المملكة.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: appColors.textColor,
                                  ),
                                )
                              ],
                            );
                          })
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.PAYMENTMETHODS),
                      child: const Button(
                        title: "فهمت ذلك",
                        Btncolor: appColors.secondColor,
                        raduis: 12,
                        Txtcolor: Colors.black,
                      ),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
