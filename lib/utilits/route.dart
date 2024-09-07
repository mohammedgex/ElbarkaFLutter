import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MyRotue extends StatelessWidget {
  const MyRotue({
    super.key,
    this.isSelected = true,
    this.price,
    this.routeName,
  });

  final bool? isSelected;
  final String? routeName;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.all(8),
      height: isSelected! ? 60 : 50,
      decoration: BoxDecoration(
        border: isSelected! ? Border.all(color: appColors.borderColor) : null,
        color: isSelected!
            ? appColors.mainColor
            : const Color.fromARGB(172, 146, 137, 137),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                IconlyBold.location,
                color: appColors.secondColor,
              ),
              const SizedBox(width: 4),
              // Wrap routeName with Flexible instead of Expanded
              SizedBox(
                width: 200,
                child: Text(
                  routeName ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: Appfonts.mainFont,
                      fontSize: 12),
                ),
              ),
            ],
          ),
          const Icon(
            IconlyLight.arrow_left_3,
            color: appColors.secondColor,
            size: 35,
          ),
          // Price text with ellipsis overflow
          Text(
            price ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: Appfonts.boldFont,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
