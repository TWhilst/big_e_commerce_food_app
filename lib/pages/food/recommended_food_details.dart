import 'package:big_e_commerce_app/pages/food/components/popular_food_details_comp/bottom_nav_bar.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/app_icons.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // sliver stuff helps us create many fancy scrolling effects and can make the scrolling process through a large number of children more efficient due to the ability to lazily build each item when it scrolls into view.
        // sliver can only work on a CustomScrollView
        slivers: [
          // SliverAppBar is a material widget in flutter that shows a collapsing toolbar. Using sliverappbar we can customize the appbar to hold widgets like toolbar, image, text, etc.
          SliverAppBar(
            // toolbarHeight gives the items on the toolbar a particular height which is the icons
            toolbarHeight: 90,
            // this takes in features of a normal appBar
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcons(icon: Icons.clear),
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
                    text: "Foodies Side",
                    size: font26,
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius20),
                    topRight: Radius.circular(radius20),
                  ),
                ),
              ),
            ),
            // this gives the appBar a backgroundColor
            backgroundColor: const Color.fromRGBO(40, 62, 78, 1),
            // this helps us to pin the appbar at the top, its default value is false
            pinned: true,
            // what this does is that it gives the appbar an elastic height that can squeeze back
            expandedHeight: 300,
            // a flexible space bar expands and contracts as the app scrolls.
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/specialimage2.webp",
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
                  child: const ExpandableText(
                    text:
                        "The Chinese dish known as stewed spring bamboo shoots is often seen in the menus of numerous restaurants in the country because it is easy to prepare, high in nutrients, and has a delicious, savory flavor. Spring bamboo shoots are unearthed around April 5, also known as the Tomb-Sweeping Day. \n In order to prepare the dish, tender bamboo shoots are simply stewed in vinegar and lots of sugar. When properly prepared, the dish should have a bright red color and a flavor which can best be described as tender, fresh, salty, and sweet. The chewy taro cake is a savory Chinese delicacy prepared with rice flour and stewed taro roots. In many ways similar to the traditional turnip cake, it usually incorporates diced Chinese sausage, pork, scallions, and mushrooms. Steamed in round or rectangular pans, it is usually shortly fried until crispy and golden before serving. Even though it is a staple in traditional dim sum restaurants in China and Hong Kong, it is also one of the most common snacks or side dishes served on Chinese New Year. The Chinese dish known as stewed spring bamboo shoots is often seen in the menus of numerous restaurants in the country because it is easy to prepare, high in nutrients, and has a delicious, savory flavor. Spring bamboo shoots are unearthed around April 5, also known as the Tomb-Sweeping Day. \n In order to prepare the dish, tender bamboo shoots are simply stewed in vinegar and lots of sugar. When properly prepared, the dish should have a bright red color and a flavor which can best be described as tender, fresh, salty, and sweet. The chewy taro cake is a savory Chinese delicacy prepared with rice flour and stewed taro roots. In many ways similar to the traditional turnip cake, it usually incorporates diced Chinese sausage, pork, scallions, and mushrooms. Steamed in round or rectangular pans, it is usually shortly fried until crispy and golden before serving. Even though it is a staple in traditional dim sum restaurants in China and Hong Kong, it is also one of the most common snacks or side dishes served on Chinese New Year. The Chinese dish known as stewed spring bamboo shoots is often seen in the menus of numerous restaurants in the country because it is easy to prepare, high in nutrients, and has a delicious, savory flavor. Spring bamboo shoots are unearthed around April 5, also known as the Tomb-Sweeping Day. \n In order to prepare the dish, tender bamboo shoots are simply stewed in vinegar and lots of sugar. When properly prepared, the dish should have a bright red color and a flavor which can best be described as tender, fresh, salty, and sweet. The chewy taro cake is a savory Chinese delicacy prepared with rice flour and stewed taro roots. In many ways similar to the traditional turnip cake, it usually incorporates diced Chinese sausage, pork, scallions, and mushrooms. Steamed in round or rectangular pans, it is usually shortly fried until crispy and golden before serving. Even though it is a staple in traditional dim sum restaurants in China and Hong Kong, it is also one of the most common snacks or side dishes served on Chinese New Year. The Chinese dish known as stewed spring bamboo shoots is often seen in the menus of numerous restaurants in the country because it is easy to prepare, high in nutrients, and has a delicious, savory flavor. Spring bamboo shoots are unearthed around April 5, also known as the Tomb-Sweeping Day. \n In order to prepare the dish, tender bamboo shoots are simply stewed in vinegar and lots of sugar. When properly prepared, the dish should have a bright red color and a flavor which can best be described as tender, fresh, salty, and sweet. The chewy taro cake is a savory Chinese delicacy prepared with rice flour and stewed taro roots. In many ways similar to the traditional turnip cake, it usually incorporates diced Chinese sausage, pork, scallions, and mushrooms. Steamed in round or rectangular pans, it is usually shortly fried until crispy and golden before serving. Even though it is a staple in traditional dim sum restaurants in China and Hong Kong, it is also one of the most common snacks or side dishes served on Chinese New Year.",
                  ),
                  margin: EdgeInsets.only(left: width20, right: width20),
                ),
              ],
            ),
          ),
        ],
      ),
      // if a column does not have a parent container but scaffold, it will take the entire space of the scaffold
      // either we wrap the column with a container or we use mainAxisSize
      bottomNavigationBar: Column(
        // this takes in MainAxisSize.min which allows the column to take the minimum amount of space
        // which is the bottom navigation bar
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: width20 * 2.5,
              right: width20 * 2.5,
              top: height10,
              bottom: height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                  icon: Icons.remove,
                  backgroundColor: mainColor,
                  iconColor: Colors.white,
                  iconSize: iconSize24,
                ),
                BigText(
                  text: "\$12.88" + " X " + " 0 ",
                  color: mainBlackColor,
                  size: font26,
                ),
                AppIcons(
                  icon: Icons.add,
                  backgroundColor: mainColor,
                  iconColor: Colors.white,
                  iconSize: iconSize24,
                ),
              ],
            ),
          ),
          const BottomNavBar(
            iconData1: Icons.favorite,
            color: mainColor,
          ),
        ],
      ),
    );
  }
}
