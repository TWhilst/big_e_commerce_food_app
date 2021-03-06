import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  const  BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.iconSize24 * 5,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height30),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20 * 2),
          topRight: Radius.circular(Dimensions.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Icon(Icons.remove, color: AppColors.signColor,),
                SizedBox(width: Dimensions.width10 / 2,),
                BigText(text: "0"),
                SizedBox(width: Dimensions.width10 / 2,),
                GestureDetector(
                  child: const Icon(Icons.add, color: AppColors.signColor,),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: AppColors.mainColor,
            ),
            child: BigText(
              text: "\$10 | Add to cart",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
