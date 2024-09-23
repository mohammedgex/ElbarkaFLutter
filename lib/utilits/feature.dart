import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class feature extends StatelessWidget {
  const feature({super.key, this.svg_url, this.text});

  final String? svg_url;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: appColors.borderColor),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svg_url!,
            color: appColors.mainColor,
            width: 25,
            height: 25,
          ),
          Text(
            text!,
            style: const TextStyle(
                fontFamily: Appfonts.lightFont,
                fontSize: 10,
                color: appColors.textColor),
          )
        ],
      ),
    );
  }
}
