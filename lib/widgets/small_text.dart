import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({Key? key, this.height = 1.2, this.color = const Color(0xFFccc7c5), this.size = 12, required this.text}) : super(key: key);

  String text;
  double? size;
  Color? color;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        height: height,
      ),
    );
  }
}
