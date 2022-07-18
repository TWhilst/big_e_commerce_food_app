import 'package:big_e_commerce_app/home/food_page_body.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

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
              margin: EdgeInsets.only(top: height45, bottom: height15),
              padding: EdgeInsets.symmetric(horizontal: width20),
              child: MainFoodAppBar(),
            ),
          ),
          FoodPageBody(),
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
            BigText(text: "Bangledesh", color: mainColor,),
            Row(
              children: [
                SmallText(text: "Narsingdi", color: Colors.black54,),
                Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ],
        ),
        Center(
          child: Container(
            width: height45,
            height: height45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius15),
              color: mainColor,
            ),
            child: Icon(Icons.search, color: Colors.white, size: iconSize24,),
          ),
        ),
      ],
    );
  }
}
