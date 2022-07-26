import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContainer extends StatelessWidget {
  final int pageId;
  const ImageContainer({
    Key? key, required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Get.find<PopularProductController>().popularProductList[pageId];
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: Dimensions.popularFoodImgSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("${AppConstants.baseUrl}${AppConstants.uploads}${products.img!}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
