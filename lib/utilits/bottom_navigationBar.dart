import 'package:baraka_trans/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/home_Icon.svg",
            color: appColors.mainColor,
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/home_Icon.svg",
            color: appColors.secondColor,
          ),
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/book.svg",
            color: appColors.mainColor,
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/book.svg",
            color: appColors.secondColor,
          ),
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            "assets/icons/profile_Icon.svg",
            color: appColors.mainColor,
          ),
          label: "",
          selectedIcon: SvgPicture.asset(
            "assets/icons/profile_Icon.svg",
            color: appColors.secondColor,
          ),
        ),
      ],
    );
  }
}
