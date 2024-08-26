import 'package:baraka_trans/consts/consts.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key,
      this.hint_text,
      this.icon,
      this.type = TextInputType.name,
      this.suffixIcon,
      this.isTextCentered = false});

  final String? hint_text;
  final Icon? icon;
  final TextInputType? type;
  final Icon? suffixIcon;
  final bool? isTextCentered;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      textAlign: isTextCentered! ? TextAlign.center : TextAlign.right,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintText: hint_text,
        hintStyle: const TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: appColors.secondColor, width: 0.5)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: appColors.mainColor, width: 1)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: appColors.secondColor, width: 0.5)),
      ),
    );
  }
}
