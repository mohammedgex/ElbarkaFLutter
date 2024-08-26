import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      this.title,
      this.Btncolor = appColors.mainColor,
      this.raduis = 0.0,
      this.Txtcolor = Colors.white});
  final String? title;
  final Color? Btncolor;
  final Color? Txtcolor;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: 56,
        decoration: BoxDecoration(
          color: Btncolor,
          borderRadius: BorderRadius.circular(raduis!),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 0),
                color: Color.fromRGBO(146, 143, 143, 0.16),
                blurRadius: 1,
                spreadRadius: 1)
          ],
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                fontFamily: Appfonts.boldFont, color: Txtcolor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
