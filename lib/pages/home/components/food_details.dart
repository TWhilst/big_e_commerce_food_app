import 'package:big_e_commerce_app/utils/colors.dart';
import 'package:big_e_commerce_app/utils/dimensions.dart';
import 'package:big_e_commerce_app/widgets/big_text.dart';
import 'package:big_e_commerce_app/widgets/icon_and_text.dart';
import 'package:big_e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  final String text;
  final double? size;
  const FoodDetails({
    Key? key, required this.text, this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallSize = Dimensions.font20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size == 0 ? smallSize : size,
        ),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndText(
              icon: Icons.location_on,
              text: "1.7km",
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              text: "32mins",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}