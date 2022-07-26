import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: const MainFoodAppBar(),
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}

class MainFoodAppBar extends StatelessWidget {
  const MainFoodAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            BigText(text: "Bangledesh", color: AppColors.mainColor,),
            Row(
              children: [
                SmallText(text: "Narsingdi", color: Colors.black54,),
                const Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            width: Dimensions.height45,
            height: Dimensions.height45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: AppColors.mainColor,
            ),
            child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
          ),
        ),
      ],
    );
  }
}
