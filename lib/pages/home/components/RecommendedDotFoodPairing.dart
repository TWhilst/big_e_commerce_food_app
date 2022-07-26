import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class RecommendedDotFoodPairing extends StatelessWidget {
  const RecommendedDotFoodPairing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Recommended"),
          SizedBox(width: Dimensions.width10,),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: BigText(text: ".", color: Colors.black26,),
          ),
          SizedBox(width: Dimensions.width10,),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(text: "Food Pairing"),
          ),
        ],
      ),
    );
  }
}

