import 'package:baraka_trans/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class bottom_NavigationBar extends StatelessWidget {
  const bottom_NavigationBar({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 65,
      onDestinationSelected: (index) {
        controller.changeIndex(index);
      },
      indicatorColor: Colors.white,
      selectedIndex: controller.currentPage.value,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 1,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            IconlyLight.home,
            color: appColors.mainColor,
          ),
          label: "الرئيسية",
          selectedIcon: Icon(
            IconlyBold.home,
            color: appColors.secondColor,
          ),
        ),
        NavigationDestination(
          icon: Icon(
            IconlyLight.bookmark,
            color: appColors.mainColor,
          ),
          label: "المحفوظات",
          selectedIcon: Icon(
            IconlyBold.bookmark,
            color: appColors.secondColor,
          ),
        ),
        NavigationDestination(
          icon: Icon(
            IconlyLight.wallet,
            color: appColors.mainColor,
          ),
          label: "المدفوعات",
          selectedIcon: Icon(
            IconlyBold.wallet,
            color: appColors.secondColor,
          ),
        ),
        NavigationDestination(
          icon: Icon(
            IconlyLight.profile,
            color: appColors.mainColor,
          ),
          label: "البروفايل",
          selectedIcon: Icon(
            IconlyBold.profile,
            color: appColors.secondColor,
          ),
        ),
      ],
    );
  }
}
