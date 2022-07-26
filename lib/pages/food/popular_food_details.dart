import 'package:big_e_commerce_app/controllers/popular_product_controller.dart';
import 'package:big_e_commerce_app/pages/food/components/popular_food_details_comp/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/popular_food_details_comp/image_container.dart';
import 'components/popular_food_details_comp/positioned_app_icons.dart';
import 'components/popular_food_details_comp/positioned_cont_with_description.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  const PopularFoodDetails({
    Key? key, required this.pageId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ImageContainer(pageId: pageId,),
          PositionedAppIcons(pageId: pageId),
          PositionedContWithDesc(pageId: pageId),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (pController) {
          return const BottomNavBar();
        }
      ),
    );
  }
}






