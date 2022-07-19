import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({Key? key, required this.icon, required this.text, required this.iconColor}) : super(key: key);
  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize24,),
        const SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
