import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final IconData? iconData1;
  final Color? color;
  final double num2;
  final String text;
  const BottomNavBar({
    Key? key,
    this.iconData1,
    this.num2 = 10,
    this.text = "Add to cart",
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize24 * 5,
      padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
      decoration: BoxDecoration(
        color: buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius20 * 2),
          topRight: Radius.circular(radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: height20,
              bottom: height20,
              left: width20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius20),
              color: Colors.white,
            ),
            child: iconData1 != null?
            Icon(
              iconData1,
              color: color,
            ) : Row(
              children: [
                const Icon(
                  Icons.remove,
                  color: signColor,
                ),
                SizedBox(
                  width: width10 / 2,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: width10 / 2,
                ),
                const Icon(
                  Icons.add,
                  color: signColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height20,
              bottom: height20,
              left: width20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius20),
              color: mainColor,
            ),
            child: BigText(
              text: "\$$num2 | $text",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
