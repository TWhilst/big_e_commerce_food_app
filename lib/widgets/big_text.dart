import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({Key? key, this.overflow = TextOverflow.ellipsis, this.color = const Color(0xFF332d2b), this.size = 0, required this.text}) : super(key: key);

  String text;
  double? size;
  Color? color;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size==0? Dimensions.font20 : size,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
      ),
    );
  }
}
