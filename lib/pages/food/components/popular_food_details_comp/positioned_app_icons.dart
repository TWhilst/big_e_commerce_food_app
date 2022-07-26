import 'package:big_e_commerce_app/pages/home/main_food_page.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionedAppIcons extends StatelessWidget {
  final int pageId;
  const PositionedAppIcons({
    Key? key, required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.height45,
      left: Dimensions.width20,
      right: Dimensions.width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.to(()=> MainFoodPage()),
            child: AppIcons(icon: Icons.arrow_back_ios),),
          AppIcons(icon: Icons.shopping_cart_outlined),
        ],
      ),
    );
  }
}
