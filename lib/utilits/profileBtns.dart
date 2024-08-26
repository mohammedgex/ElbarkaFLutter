import 'package:flutter/material.dart';

class Profilebtns extends StatelessWidget {
  const Profilebtns({super.key, this.title, this.icon});
  final String? title;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon!,
            const SizedBox(
              width: 4,
            ),
            Text(
              "$title",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Icon(Icons.arrow_back_ios)
      ],
    );
  }
}
