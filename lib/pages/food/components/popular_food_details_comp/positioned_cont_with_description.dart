import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/pages/home/components/food_details.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'header_with_description.dart';

class PositionedContWithDesc extends StatelessWidget {
  final int pageId;
  const PositionedContWithDesc({
    Key? key, required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Get.find<PopularProductController>().popularProductList[pageId];
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: Dimensions.popularFoodImgSize - Dimensions.height20,
      child: Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              topLeft: Radius.circular(Dimensions.radius20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodDetails(
                text: products.name!,
                size: Dimensions.font26,
              ),
              SizedBox(height: Dimensions.height20,),
              BigText(text: "Introduce",),
              SizedBox(height: Dimensions.height20,),
              Expanded(
                child: SingleChildScrollView(
                  child: ExpandableText(text: products.description!),
                ),
              ),// HeaderWithDescription(pageId: pageId,)
            ],
          )
      ),
    );
  }
}