import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDotsIndicator extends StatelessWidget {
  final double currentValue;
  const FoodDotsIndicator({
    Key? key, required this.currentValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
        builder: (context) {
          return DotsIndicator(
            dotsCount: context.popularProductList.isEmpty? 1: context.popularProductList.length,
            position: currentValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }
    );
  }
}
