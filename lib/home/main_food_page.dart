import 'package:big_e_commerce_app/home/food_page_body.dart';
import 'package:big_e_commerce_app/utils/colors.dart';
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
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MainFoodAppBar(),
            )
          ),
          FoodPageBody()
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
            width: 45,
            height: 45,
            child: Icon(Icons.search, color: Colors.white,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
