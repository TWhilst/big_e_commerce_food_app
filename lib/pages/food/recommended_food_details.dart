import 'package:big_e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:big_e_commerce_app/pages/food/components/popular_food_details_comp/bottom_nav_bar.dart';
import 'package:big_e_commerce_app/routes/route_helper.dart';
import 'package:big_e_commerce_app/utils/app_constants.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/app_icons.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/recommended_food_details_comp/bottom_nav_bar2.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId2;
  const RecommendedFoodDetails({
    Key? key, required this.pageId2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Get.find<RecommendedProductController>().recommendedProductList[pageId2];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // sliver stuff helps us create many fancy scrolling effects and can make the scrolling process through a large number of children more efficient due to the ability to lazily build each item when it scrolls into view.
        // sliver can only work on a CustomScrollView
        slivers: [
          // SliverAppBar is a material widget in flutter that shows a collapsing toolbar. Using sliverappbar we can customize the appbar to hold widgets like toolbar, image, text, etc.
          SliverAppBar(
            // what this does is to stop is from creating a back icon
            automaticallyImplyLeading: false,
            // toolbarHeight gives the items on the toolbar a particular height which is the icons
            toolbarHeight: 90,
            // this takes in features of a normal appBar
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.getInitial()),
                  child: AppIcons(icon: Icons.clear),
                ),
                AppIcons(icon: Icons.shopping_cart_outlined),
              ],
            ),
            // this is used to add a decorated container with text on the appBar
            // we use the property bottom which takes in a widget of preferred size
            // this takes in a widget and adds it at the bottom of the appBar
            bottom: PreferredSize(
              // Size.fromHeight(20) is where the container will start from that is height20
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: products.name!,
                    size: Dimensions.font26,
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            // this gives the appBar a backgroundColor
            backgroundColor: AppColors.yellowColor,
            // this helps us to pin the appbar at the top, its default value is false
            pinned: true,
            // what this does is that it gives the appbar an elastic height that can squeeze back
            expandedHeight: 300,
            // a flexible space bar expands and contracts as the app scrolls.
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.baseUrl}/uploads/${products.img!}",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverToBoxAdapter takes in the body of the SliverAppBar
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(
                    text: products.description!
                  ),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      // if a column does not have a parent container but scaffold, it will take the entire space of the scaffold
      // either we wrap the column with a container or we use mainAxisSize

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$${products.price}" + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcons(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          BottomNavBar2(),
        ],
      ),
    );
  }
}

// iconData1: Icons.favorite,
// color: AppColors.mainColor,

// bottomNavigationBar: Column(
// // this takes in MainAxisSize.min which allows the column to take the minimum amount of space
// // which is the bottom navigation bar
// mainAxisSize: MainAxisSize.min,
// children: [
// Container(
// padding: EdgeInsets.only(
// left: Dimensions.width20 * 2.5,
// right: Dimensions.width20 * 2.5,
// top: Dimensions.height10,
// bottom: Dimensions.height10,
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// AppIcons(
// icon: Icons.remove,
// backgroundColor: AppColors.mainColor,
// iconColor: Colors.white,
// iconSize: Dimensions.iconSize24,
// ),





// AppIcons(
//
// ),
// ],
// ),
// ),

// ],
// ),
