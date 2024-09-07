import 'package:baraka_trans/consts/consts.dart';
import 'package:baraka_trans/consts/fonts.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key,
      this.hint_text,
      this.icon,
      this.type = TextInputType.name,
      this.suffixIcon,
      this.isTextCentered = false,
      this.textFieldController,
      this.validation,
      this.value});

  final String? hint_text;
  final Icon? icon;
  final TextInputType? type;
  final Icon? suffixIcon;
  final bool? isTextCentered;
  final TextEditingController? textFieldController;
  final String? Function(String?)? validation;
  final String? Function(String?)? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      validator: validation,
      onChanged: value ?? null,
      controller: textFieldController,
      textAlign: isTextCentered! ? TextAlign.center : TextAlign.right,
      decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          hintText: hint_text,
          hintStyle:
              const TextStyle(fontSize: 12, fontFamily: Appfonts.lightFont),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: appColors.secondColor, width: 0.5)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: appColors.mainColor, width: 1)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: appColors.secondColor, width: 0.5)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 0.5))),
    );
  }
}
