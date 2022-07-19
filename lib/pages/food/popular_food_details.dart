import 'package:big_e_commerce_app/pages/food/components/popular_food_details_comp/bottom_navigation_bar.dart';
import 'package:big_e_commerce_app/pages/home/components/slider_section.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/app_icons.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [
          ImageContainer(),
          PositionedAppIcons(),
          PositionedContWithDesc(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class PositionedContWithDesc extends StatelessWidget {
  const PositionedContWithDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: popularFoodImgSize - height20,
      child: Container(
          padding: EdgeInsets.only(
              left: width20, right: width20, top: height20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius20),
              topLeft: Radius.circular(radius20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodDetails(
                text: "Chinese Side",
                size: font26,
              ),
              SizedBox(height: height20,),
              BigText(text: "Introduce",),
              SizedBox(height: height20,),
              const Expanded(
                child: SingleChildScrollView(
                  child: ExpandableText(text: "The Chinese dish known as stewed spring bamboo shoots is often seen in the menus of numerous restaurants in the country because it is easy to prepare, high in nutrients, and has a delicious, savory flavor. Spring bamboo shoots are unearthed around April 5, also known as the Tomb-Sweeping Day. \n In order to prepare the dish, tender bamboo shoots are simply stewed in vinegar and lots of sugar. When properly prepared, the dish should have a bright red color and a flavor which can best be described as tender, fresh, salty, and sweet. The chewy taro cake is a savory Chinese delicacy prepared with rice flour and stewed taro roots. In many ways similar to the traditional turnip cake, it usually incorporates diced Chinese sausage, pork, scallions, and mushrooms. Steamed in round or rectangular pans, it is usually shortly fried until crispy and golden before serving. Even though it is a staple in traditional dim sum restaurants in China and Hong Kong, it is also one of the most common snacks or side dishes served on Chinese New Year."),),
              ),
            ],
          )
      ),
    );
  }
}

class PositionedAppIcons extends StatelessWidget {
  const PositionedAppIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height45,
      left: width20,
      right: width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppIcons(icon: Icons.arrow_back_ios),
          AppIcons(icon: Icons.shopping_cart_outlined),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: popularFoodImgSize,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/food15.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
