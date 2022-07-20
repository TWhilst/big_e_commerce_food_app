import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color iconColor, backgroundColor;
  final double size;
  final double iconSize;

  const AppIcons({
    Key? key,
    required this.icon,
    this.iconColor = const Color(0xFF756D54),
    this.backgroundColor = const Color(0xFFFCF4E4),
    this.size = 40,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 16? iconSize16 : iconSize,
      ),
    );
  }
}
