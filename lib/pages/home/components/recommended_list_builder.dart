import 'package:big_e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:big_e_commerce_app/models/products_model.dart';
import 'package:big_e_commerce_app/routes/route_helper.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recommended_image_details.dart';
import 'recommended_images.dart';

class RecommendedListBuilder extends StatelessWidget {
  const RecommendedListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedProductController>(
        builder: (controller) {
          return controller.isLoading? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.recommendedProductList.length,
              itemBuilder: (context, index) {
                ProductModel products = controller.recommendedProductList[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        RecommendedImages(image: products.img!,),
                        RecommendedImageDetails(name: products.name),
                      ],
                    ),
                  ),
                );

              }

          ) : const CircularProgressIndicator(color: AppColors.mainColor,);
        }
    );
  }
}